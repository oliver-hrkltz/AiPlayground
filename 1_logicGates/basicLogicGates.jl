include("../0_neuron/neuronBinary.jl")

function and(i0, i1)
    return neuronBinary(i0, i1, 1.0, 1.0, -1.0)
end

function nand(i0, i1)
    return neuronBinary(i0, i1, -1.0, -1.0, 2.0)
end

function nor(i0, i1)
    return neuronBinary(i0, i1, -1.0, -1.0, 1.0)
end

function or(i0, i1)
    return neuronBinary(i0, i1, 1.0, 1.0, 0.0)
end
