const REF_COUNTS = Dict("red"=>12,"green"=>13,"blue"=>14)
const COLOURS = keys(REF_COUNTS)

function day02(file)
    counts = [Dict(c=>maximum(parse(Int,only(m)) for m in eachmatch(Regex("(\\d+) $c"),l); init=0) 
                for c in COLOURS)
                    for l in eachline(file)];
    return sum(findall(all(game[c]<=REF_COUNTS[c] for c in COLOURS) for game in counts)),
           sum(prod(values(game)) for game in counts)
end
    