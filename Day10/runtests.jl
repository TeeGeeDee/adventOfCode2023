using Test
include("day10.jl")

const TEST_INPUT1 = """
.....
.S-7.
.|.|.
.L-J.
.....
"""

const TEST_INPUT2 = """
..F7.
.FJ|.
SJ.L7
|F--J
LJ...
"""

@test day10(IOBuffer(TEST_INPUT1))==4
@test day10(IOBuffer(TEST_INPUT2))==8
