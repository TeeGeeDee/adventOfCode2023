function day08(file)
    textblock = Iterators.takewhile(!isempty,eachline(file));
    directions = Iterators.cycle(only(textblock));
    network = Dict(begin
                    (s,l,r) = match(r"([A-Z]+) = \(([A-Z]+), ([A-Z]+)\)",line);
                    String(s)=>String.([l,r])
                end
                for line in textblock);
    return part1(directions,network),part2(directions,network)
end

function part1(directions,network)
    pos = "AAA";
    for (i,d) in enumerate(directions)
        pos = network[pos][d=='L' ? 1 : 2];
        if pos=="ZZZ"
            return i
        end
    end
end

function part2(directions,network)
    # Idea: At some point the path through the network will circle back on itself and repeat
    # Can summarise arrival schedule in 'Z' states for each starting 'A' with a StepRange
    startposisions = [k for k in keys(network) if endswith(k,'A')];
    arrivalschedules = Dict{String,StepRange{BigInt, BigInt}}(); # initially got burned by In64 overflow in intersect(StepRange,StepRange)
    for start in startposisions
        pos = start;
        arrivals = Vector{BigInt}()
        for (i,d) in enumerate(directions)
            pos = network[pos][d=='L' ? 1 : 2];
            if endswith(pos,'Z')
                push!(arrivals,i);
                if length(arrivals)==2 # once we've seen 2 arrivals we can deduce the schedule
                    break
                end
            end
        end
        arrivalschedules[start] = arrivals[1]:(arrivals[2]-arrivals[1]):typemax(Int); # assume answer is less than typemax(Int)
    end
    return first(reduce(intersect,values(arrivalschedules))) # intersect on StepRange does the hard work for us
end
