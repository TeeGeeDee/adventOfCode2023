const Link = CartesianIndex{2}; # offset to connected neighbour
const Up    = Link((0,-1)); # used with matrices so 'Up' is lower index
const Down  = Link((0,1));
const Right = Link((1,0));
const Left  = Link((-1,0));
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
    sketch::Matrix{Part} = foldl(hcat,collect.(readlines(file)));
    start = findfirst(sketch.=='S');
    for startdirection in Directions
        pos = start;
        d = startdirection;
        i = 0;
        while checkbounds(Bool,sketch,pos+d) &&
                -d in Connections[sketch[pos+d]] && # required link faces opposite way from which we're coming
                (sketch[pos]!='S' || i==0)
            i += 1;
            pos = pos+d;
            if sketch[pos]=='S' && i>0
                return div(i,2)
            end
            d = only(setdiff(Connections[sketch[pos]],[-d])); # link not used to get here
        end
    end
end
