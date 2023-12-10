const Link = CartesianIndex{2}; # offset to connected neighbour
const Tile = CartesianIndex{2};
const Up    = Link((-1,0)); # used with matrices so 'Up' is lower index
const Down  = Link((1,0));
const Right = Link((0,1));
const Left  = Link((0,-1));
const Directions = [Up,Down,Left,Right];
const Part = Char; # cant shadow Pipe

const Connections = Dict{Part,Vector{Link}}(
    '|'=>[Up,Down],
    '-'=>[Left,Right],
    'L'=>[Up,Right],
    'J'=>[Up,Left],
    '7'=>[Left,Down],
    'F'=>[Down,Right],
    '.'=>Vector{Link}(),
    'S'=>Directions); # S potentially connects anywhere because is unknown

function day10(file)
    sketch::Matrix{Part} = foldl(vcat,permutedims.(collect.(readlines(file))));
    loop,path = findloop(sketch);
    return div(length(loop),2), part2(sketch,loop,path)
end

function findloop(sketch::Matrix{Part})
    start = findfirst(sketch.=='S');
    for startdirection in Directions
        pos = start;
        d = startdirection;
        loop = Set{Tile}();
        path = Vector{Link}();
        while checkbounds(Bool,sketch,pos+d) &&
                -d in Connections[sketch[pos+d]] # required link faces opposite way from which we're coming
            push!(loop,pos);
            push!(path,d);
            pos = pos+d;
            if sketch[pos]=='S'
                return loop,path
            end
            d = only(setdiff(Connections[sketch[pos]],[-d])); # link not used to get here
        end
    end
end

function part2(sketch::Matrix{Part},loop::Set{Tile},path)
    sketch,loop = blowup(sketch::Matrix{Part},loop,path);
    alltiles = Set(eachindex(IndexCartesian(),sketch));
    candidatetiles = setdiff(alltiles,loop);
    insidetiles = Set{Tile}();
    while !isempty(candidatetiles)
        isinside = true;
        planned = Set{Tile}([pop!(candidatetiles)]);
        visited = Set{Tile}();
        while !isempty(planned)
            tile = pop!(planned);
            push!(visited,tile);
            neighbours = [tile+d for d in Directions];
            isinside &= all(checkbounds(Bool,sketch,t) for t in neighbours);
            union!(planned,Set(pop!(candidatetiles,t) for t in neighbours if t in candidatetiles));
        end
        if isinside
            union!(insidetiles,visited);
        end
    end
    # finally, revert back to original size
    insidetiles = [ind for ind in insidetiles if iseven(ind.I[1]) && iseven(ind.I[2])];
    return length(insidetiles)
end

function blowup(sketch::Matrix{Part},loop,path)
    # Expand matrix by factor of 2 in both dimentions to create "gaps" described in question
    # extend loop to fill in appropriate gaps
    sketchout = repeat(['.'],2*size(sketch,1),2*size(sketch,2));
    for pos in loop
        sketchout[2*pos] = sketch[pos];
    end
    loopout = Set(2*pos for pos in loop);
    pos = findfirst(sketchout.=='S');
    for m in path
        pos += m;
        sketchout[pos] = m in (Left,Right) ? '-' : '|';
        push!(loopout,pos);
        pos += m;
    end
    return sketchout,loopout
end