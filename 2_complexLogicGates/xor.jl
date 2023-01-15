include("../1_basicLogicGates/and.jl")
include("../1_basicLogicGates/nor.jl")

# XOR based on a NN with 2 hidden layers and 3 neurons
# i0
#      AND()
#              NOR()
# i1
#      NOR()
#
function XOR(i0, i1)
	return nor(and(i0, i1), nor(i0, i1))
end