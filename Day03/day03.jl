const DIRECTIONS = CartesianIndices((-1:1,-1:1))
const Loc = CartesianIndex{2}

function day03(file)
    lines = readlines(file);
    # Uniquely identify each number by its starting position (the key)
    # Make maps for: position of each integer -> key; key -> number; and symbol position -> symbol,touching keys
    keytonum    = Dict{Loc,Int}();
    intloctokey = Dict{Loc,Loc}(); # location of integer to location of start of number
    for (i,line) in enumerate(lines)
        for regmatch in eachmatch(r"\d+",line)
            startposition = Loc(i,regmatch.offset);
            keytonum[startposition] = parse(Int,regmatch.match);
            for pos in startposition.+CartesianIndices((0:0,0:(length(regmatch.match)-1)))
                intloctokey[pos] = startposition;
            end
        end
    end
    Part = NamedTuple{(:symbol, :numkeys), Tuple{String, Set{Loc}}};
    parts = Vector{Part}();
    for (i,line) in enumerate(lines)
        for regmatch in eachmatch(r"[^\d\.]",line)
            partposition = Loc(i,regmatch.offset);
            uniqueadjnumkeys = Set(intloctokey[p] for p in partposition.+DIRECTIONS if p in keys(intloctokey));
            append!(parts,((symbol=regmatch.match,numkeys=uniqueadjnumkeys),));
        end
    end
    partnumberstarts = Set(start for part in parts for start in part.numkeys); # Set to avoid double-counting matches to multiple parts
    partsum = sum(keytonum[start] for start in partnumberstarts);
    gears = [part for part in parts if part.symbol=="*" && length(part.numkeys)==2];
    gearsum = sum(prod(keytonum[start] for start in gear.numkeys) for gear in gears);
    return partsum,gearsum
end
