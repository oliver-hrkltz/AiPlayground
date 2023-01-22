# Note: A function should be broadcasted via (Dot Syntax for Broadcasting)[https://docs.julialang.org/en/v1/manual/functions/#man-vectorized]
function sigmoid(z::Real)
    return 1.0 / (1.0 + exp(-z))
end

# Matrix version of a neuron with two inputs.
function neuron(w0, w1, i0, i1, b)
    return sigmoid.(([w0 w1] * [i0; i1] + [b]))
end
