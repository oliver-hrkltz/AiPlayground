using Test
include("./xor.jl")

@testset "XOR(0, 0)" begin
    @test xor(0, 0) == 0
end
@testset "XOR(0, 1)" begin
    @test xor(0, 1) == 1
end
@testset "XOR(1, 0)" begin
    @test xor(1, 0) == 1
end
@testset "XOR(1, 1)" begin
    @test xor(1, 1) == 0
end
