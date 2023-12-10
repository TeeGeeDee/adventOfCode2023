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

const TEST_INPUT3 = """
LR

AAA = (AAB, XXX)
AAB = (XXX, ZZZ)
ZZZ = (AAB, XXX)
EEA = (EEB, XXX)
EEB = (EEC, EEC)
EEC = (EEZ, EEZ)
EEZ = (EEB, EEB)
XXX = (XXX, XXX)
""" # modified to remove numbers and to contain both AAA and ZZZ to play nice with part 1

@test day08(IOBuffer(TEST_INPUT1))[1]==2
@test day08(IOBuffer(TEST_INPUT2))[1]==6
