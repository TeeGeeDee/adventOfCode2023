function day01(file)
    lines = readlines(file);
    calibrate(txt) = sum(parse(Int,l[findfirst(isnumeric,l)]*l[findlast(isnumeric,l)]) for l in txt if any(isnumeric(c) for c in l));
    t2n = ("one"=>"1","two"=>"2","three"=>"3","four"=>"4","five"=>"5","six"=>"6","seven"=>"7","eight"=>"8","nine"=>"9");
    t2n = (Regex("(?<=$(t[1]))$(t[2:end-1])(?=$(t[end]))")=>n for (t,n) in t2n); # account for overlaps by using lookarounds
    return calibrate(lines),calibrate(replace.(lines,t2n...))
end