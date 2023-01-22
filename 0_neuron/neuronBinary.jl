include("../0_neuron/neuron.jl")

# Bacause a logic gate is a binary element we need to extend the basic Neuron with an activation function to map the output to 0 or 1.
function neuronBinary(i0, i1, w0, w1, b)
    return ((neuron(i0, i1, w0, w1, b)) >= 1) ? 1 : 0
end
