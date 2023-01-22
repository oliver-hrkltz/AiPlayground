using Test
include("./complexLogicGates.jl")

@testset "xor" begin
    @test xor(0, 0) == 0
    @test xor(0, 1) == 1
    @test xor(1, 0) == 1
    @test xor(1, 1) == 0
end
