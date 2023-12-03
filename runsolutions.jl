include("Day01/day01.jl");
include("Day02/day02.jl");

# Compile (what it says to do here: https://docs.julialang.org/en/v1/manual/performance-tips/#Measure-performance-with-[@time](@ref)-and-pay-attention-to-memory-allocation)
open(day01,"Day01/data.txt");
open(day02,"Day02/data.txt");

println("Day 1:");
@time out = open(day01,"Day01/data.txt");
# 0.002911 seconds (7.42 k allocations: 330.516 KiB)
println("Solutions = $out");
# Solutions = (55208, 54578).
println("Day 2:");
@time out = open(day02,"Day02/data.txt");
# 0.004024 seconds (7.05 k allocations: 399.413 KiB)
println("Solutions = $out");
# Solutions = (2256, 74229)
