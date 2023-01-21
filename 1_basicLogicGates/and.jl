include("../0_neuron/neuron.jl")

function and(i0, i1)
    return neuron(i0, i1, 1.0, 1.0, -1.0)
end

function and2(i0, i1)
    return neuron2(i0, i1, 1.0, 1.0, -1.0)
end

function and3(i0, i1)
    return neuron3([i0; i1], [1.0 1.0], [-1.0])
end
