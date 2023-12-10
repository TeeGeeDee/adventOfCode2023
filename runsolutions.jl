include("Day01/day01.jl");
include("Day02/day02.jl");
include("Day03/day03.jl");
include("Day04/day04.jl");
include("Day06/day06.jl");
include("Day08/day08.jl");

# Compile (what it says to do here: https://docs.julialang.org/en/v1/manual/performance-tips/#Measure-performance-with-[@time](@ref)-and-pay-attention-to-memory-allocation)
open(day01,"Day01/data.txt");
open(day02,"Day02/data.txt");
open(day03,"Day03/data.txt");
open(day04,"Day04/data.txt");
open(day06,"Day06/data.txt");
open(day08,"Day08/data.txt");

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
println("Day 3:");
@time out = open(day03,"Day03/data.txt");
# 0.003002 seconds (11.65 k allocations: 1.836 MiB)
println("Solutions = $out");
# Solutions = (535351, 87287096)
println("Day 4:");
@time out = open(day04,"Day04/data.txt");
# 0.002151 seconds (6.36 k allocations: 1.101 MiB)
println("Solutions = $out");
# Solutions = (26443, 6.284877e6)
println("Day 6:");
@time out = open(day06,"Day06/data.txt");
# 0.000116 seconds (73 allocations: 4.164 KiB)
println("Solutions = $out");
# Solutions = (741000, 38220708)
println("Day 8:");
@time out = open(day08,"Day08/data.txt");
# 0.008764 seconds (16.36 k allocations: 788.539 KiB)
println("Solutions = $out");
# Solutions = (17873, 15746133679061)