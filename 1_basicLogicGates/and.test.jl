using Test
include("./and.jl")

@testset "AND(0, 0)" begin
    @test and(0, 0) == 0
end

@testset "AND(0, 1)" begin
    @test and(0, 1) == 0
end

@testset "AND(1, 0)" begin
    @test and(1, 0) == 0
end

@testset "AND(1, 1)" begin
    @test and(1, 1) == 1
end
