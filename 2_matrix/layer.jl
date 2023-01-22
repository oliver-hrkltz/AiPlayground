# Generalized version representing a full layer with variable amount of inputs.
# Example: [w0 w1] * [i0; i1] + [b]
function layer(w, i, b)
    return ((w * i + b) >= [1]) ? 1 : 0
end
