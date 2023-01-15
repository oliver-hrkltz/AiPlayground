include("../0_neuron/neuron.jl")

function nand(i0, i1)
	return neuron(i0, i1, -1.0, -1.0, 2.0)
end