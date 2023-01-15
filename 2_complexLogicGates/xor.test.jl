using Test
include("./xor.jl")

# XOR:
# i0 i1 | o0
#  0  0 |  0
#  1  0 |  1
#  0  1 |  1
#  0  0 |  0 

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