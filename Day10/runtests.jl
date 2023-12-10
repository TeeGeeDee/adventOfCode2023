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

const TEST_INPUT3 = """
...........
.S-------7.
.|F-----7|.
.||.....||.
.||.....||.
.|L-7.F-J|.
.|..|.|..|.
.L--J.L--J.
...........
"""

const TEST_INPUT4 = """
..........
.S------7.
.|F----7|.
.||....||.
.||....||.
.|L-7F-J|.
.|..||..|.
.L--JL--J.
..........
"""

const TEST_INPUT5 = """
.F----7F7F7F7F-7....
.|F--7||||||||FJ....
.||.FJ||||||||L7....
FJL7L7LJLJ||LJ.L-7..
L--J.L7...LJS7F-7L7.
....F-J..F7FJ|L7L7L7
....L7.F7||L7|.L7L7|
.....|FJLJ|FJ|F7|.LJ
....FJL-7.||.||||...
....L---J.LJ.LJLJ...
"""

const TEST_INPUT6 = """
FF7FSF7F7F7F7F7F---7
L|LJ||||||||||||F--J
FL-7LJLJ||||||LJL-77
F--JF--7||LJLJ7F7FJ-
L---JF-JLJ.||-FJLJJ7
|F|F-JF---7F7-L7L|7|
|FFJF7L7F-JF7|JL---7
7-L-JL7||F7|L7F-7F7|
L.L7LFJ|||||FJL7||LJ
L7JLJL-JLJLJL--JLJ.L
"""

@test day10(IOBuffer(TEST_INPUT1))[1]==4
@test day10(IOBuffer(TEST_INPUT2))[1]==8
@test day10(IOBuffer(TEST_INPUT3))[2]==4
@test day10(IOBuffer(TEST_INPUT4))[2]==4
@test day10(IOBuffer(TEST_INPUT5))[2]==8
@test day10(IOBuffer(TEST_INPUT6))[2]==10

