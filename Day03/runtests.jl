using Test
include("day03.jl")

const TEST_INPUT = raw"467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598.."

@test day03(IOBuffer(TEST_INPUT))==(4361,467835)
