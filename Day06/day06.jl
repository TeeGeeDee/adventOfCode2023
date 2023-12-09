function day06(file)
    lines = readlines(file);
    times     = [parse(Int,only(m)) for m in eachmatch(r" (\d+)",lines[1])];
    distances = [parse(Int,only(m)) for m in eachmatch(r" (\d+)",lines[2])];
    # Solve h * (t-h) = d. h^2 -t*h + d = 0. Solutions: (t +- sqrt(t^2-4*d))/2
    # Answer = smallest int larger than upper solution - largest int smaller than lower solution + 1
    nextbigger(x)  = isinteger(x) ? x+1 : ceil(x);
    nextsmaller(x) = isinteger(x) ? x-1 : floor(x);
    solve(ts,ds) = prod(Int,1+nextsmaller((t + sqrt(t^2-4d))/2)-nextbigger((t - sqrt(t^2-4d))/2) for (t, d) in zip(ts, ds));
    times2     = parse(Int,replace(lines[1],r"[^\d]"=>""));
    distances2 = parse(Int,replace(lines[2],r"[^\d]"=>""));
    return solve(times, distances),solve(times2,distances2)
end