# Note: A function should be broadcasted via (Dot Syntax for Broadcasting)[https://docs.julialang.org/en/v1/manual/functions/#man-vectorized]
function biggerOrEqualOne(z::Real)
    return (z >= 1.0) ? 1.0 : 0.0
end

function layer1(i)
    return biggerOrEqualOne.([1.0 1.0; -1.0 -1.0] * i + [-1.0; 1.0])
end

function layer2(i)
    return (([-1.0 -1.0] * i + [1.0]) >= [1]) ? 1.0 : 0.0
end

function xor(i0, i1)
    return layer2(layer1([i0; i1]))
end
