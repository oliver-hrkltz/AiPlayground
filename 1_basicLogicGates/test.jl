using Test

@testset "and.jl" begin
    include("./and.test.jl")
end

@testset "nand.jl" begin
    include("./nand.test.jl")
end

@testset "nor.jl" begin
    include("./nor.test.jl")
end

@testset "or.jl" begin
    include("./or.test.jl")
end
