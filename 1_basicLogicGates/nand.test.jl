using Test
include("./nand.jl")

@testset "NAND(0, 0)" begin
    @test nand(0, 0) == 1
end

@testset "NAND(0, 1)" begin
    @test nand(0, 1) == 1
end

@testset "NAND(1, 0)" begin
    @test nand(1, 0) == 1
end

@testset "NAND(1, 1)" begin
    @test nand(1, 1) == 0
end
