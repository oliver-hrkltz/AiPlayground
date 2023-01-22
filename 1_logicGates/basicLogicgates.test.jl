using Test
include("./basicLogicGates.jl")

@testset "and" begin
    @test and(0, 0) == 0
    @test and(0, 1) == 0
    @test and(1, 0) == 0
    @test and(1, 1) == 1
end

@testset "nand" begin
    @test nand(0, 0) == 1
    @test nand(0, 1) == 1
    @test nand(1, 0) == 1
    @test nand(1, 1) == 0
end

@testset "nor" begin
    @test nor(0, 0) == 1
    @test nor(1, 0) == 0
    @test nor(0, 1) == 0
    @test nor(1, 1) == 0
end

@testset "or" begin
    @test or(0, 0) == 0
    @test or(0, 1) == 1
    @test or(1, 0) == 1
    @test or(1, 1) == 1
end
