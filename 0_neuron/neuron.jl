# Basic version of a neuron with two inputs.
function neuron(i0, i1, w0, w1, b)
    return (((i0 * w0) + (i1 * w1) + b) >= 1) ? 1 : 0
end

# Matrix version of a neuron with two inputs.
function neuron2(i0, i1, w0, w1, b)
    return (([w0 w1] * [i0; i1] + [b]) >= [1]) ? 1 : 0
end

# Generalized version of a neuron with variable amount of inputs.
function neuron3(i, w, b)
    return ((w * i + b) >= [1]) ? 1 : 0
end
