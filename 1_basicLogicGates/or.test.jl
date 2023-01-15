using Test
include("./or.jl")

@testset "OR(0, 0)" begin
	@test or(0, 0) == 0
end

@testset "OR(0, 0)" begin
	@test or(0, 1) == 1
end

@testset "OR(0, 0)" begin
	@test or(1, 0) == 1
end

@testset "OR(0, 0)" begin
	@test or(1, 1) == 1
end