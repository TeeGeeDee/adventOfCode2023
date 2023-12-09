function day08(file)
    textblock  = Iterators.takewhile(!isempty,eachline(file));
    directions = Iterators.cycle(only(textblock));
    network = Dict(begin
                    (s,l,r) = match(r"([A-Z]+) = \(([A-Z]+), ([A-Z]+)\)",line);
                    s=>[l,r]
                end
                for line in textblock);
    pos = "AAA";
    for (i,d) in enumerate(directions)
        pos = network[pos][d=='L' ? 1 : 2];
        if pos=="ZZZ"
            return i
        end
    end
end
