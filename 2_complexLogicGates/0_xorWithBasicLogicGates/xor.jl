include("../../1_basicLogicGates/and.jl")
include("../../1_basicLogicGates/nor.jl")

function XOR(i0, i1)
    return nor(and(i0, i1), nor(i0, i1))
end
