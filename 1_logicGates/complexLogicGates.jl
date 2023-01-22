include("./basicLogicGates.jl")

function xor(i0, i1)
    return nor(and(i0, i1), nor(i0, i1))
end
