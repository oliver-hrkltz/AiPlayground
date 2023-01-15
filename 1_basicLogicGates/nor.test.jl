using Test
include("./nor.jl")

@testset "NOR(0, 0)" begin
	@test nor(0, 0) == 1
end

@testset "NOR(1, 0)" begin
	@test nor(1,0) == 0
end

@testset "NOR(0, 1)" begin
	@test nor(0, 1) == 0
end

@testset "NOR(1, 1)" begin
	@test nor(1, 1) == 0
end