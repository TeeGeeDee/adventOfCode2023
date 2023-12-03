using Test
include("day01.jl")

const TEST_INPUT1 = "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet"

const TEST_INPUT2 = "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen"

# need better test cases for word overlaps
const TEST_INPUT3 = "1twone"


@test day01(IOBuffer(TEST_INPUT1))[1]==142
@test day01(IOBuffer(TEST_INPUT2))[2]==281
@test day01(IOBuffer(TEST_INPUT3))[2]==11

