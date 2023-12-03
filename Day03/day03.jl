const DIRECTIONS = CartesianIndices((-1:1,-1:1))

function day03(file)
    lines = readlines(file);
    # Uniquely identify each number by its starting position (the key)
    # Make maps for: position of part of number -> key; key -> number; and symbol position -> symbol,touching keys
    startpostonum = Dict(CartesianIndex(i,m.offset)=>parse(Int,m.match)
        for (i,line) in enumerate(lines) for m in eachmatch(r"\d+",line));
    postostart = Dict(pos=>start for (start,num) in startpostonum for pos in start.+CartesianIndices((0:0,0:(0+length(string(num))-1))));
    parts = [(symbol=m.match,
              numstarts=Set(postostart[p] for p in CartesianIndex(i,m.offset).+DIRECTIONS if p in keys(postostart)))
                for (i,line) in enumerate(lines) for m in eachmatch(r"[^\d\.]",line)];
    partsum = sum(startpostonum[unqstart] for unqstart in Set(start for part in parts for start in part.numstarts));
    gearsum = sum(prod(startpostonum[start] for start in part.numstarts) for part in parts if part.symbol=="*" && length(part.numstarts)==2);
    return partsum,gearsum
end
