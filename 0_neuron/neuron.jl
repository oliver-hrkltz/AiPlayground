function neuron(i0, i1, w0, w1, b)
    return ((i0*w0) + (i1*w1) + b >= 1) ? 1 : 0
end
