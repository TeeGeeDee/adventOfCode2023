using Test
include("day08.jl")

const TEST_INPUT1 = """
RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)
"""

const TEST_INPUT2 = """
LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)
"""

@test day08(IOBuffer(TEST_INPUT1))[1]==2
@test day08(IOBuffer(TEST_INPUT2))[1]==6
