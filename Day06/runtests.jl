using Test
include("day06.jl")

const TEST_INPUT = """
Time:      7  15   30
Distance:  9  40  200
"""

@test day06(IOBuffer(TEST_INPUT))==(288,71503)
