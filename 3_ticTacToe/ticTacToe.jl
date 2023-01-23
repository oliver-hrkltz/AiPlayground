using DelimitedFiles

function step1()
    println("1. Step: Generate ", 3^9, " possible board states.")
    symbols = ['-', 'O', 'X']
    result = Array{Array{Char,1},1}(undef, 3^9)

    for i in 1:3^9
        currentBoardStateVector = Array{Char,1}(undef, 9)
        c = i

        for j in 1:9
            currentBoardStateVector[j] = symbols[floor(Int, (c % 3 + 1))]
            c /= 3
        end

        result[i] = currentBoardStateVector
    end

    return result
end

boardArray = step1()
println("> E.g.: ", boardArray[rand(1:length(boardArray))])
println()


function step2A(boardArray)
    println("2. Step: Filter all invalid board states.")
    # TODO: This function is missing the states where a player already won. E.g.: O	O	O	X	X	X	-	-	-
    invalidBoardStateIndexArray = Array{Int,1}(undef, 0)
    invalidBoardStateMarkerArray = Array{Bool,1}(undef, 3^9)
    i = 0

    for boardState in boardArray
        i += 1
        countX = 0
        countO = 0

        for ii in 1:9
            if boardState[ii] == 'X'
                countX += 1
            elseif boardState[ii] == 'O'
                countO += 1
            end
        end

        if (countX > countO + 1) || (countO > countX + 1)
            append!(invalidBoardStateIndexArray, i)
            invalidBoardStateMarkerArray[i] = true
        else
            invalidBoardStateMarkerArray[i] = false
        end
    end

    return deleteat!(boardArray, invalidBoardStateMarkerArray)
end

# This version is shorter but much slower. One reason could be that it needs to count() twice for one decision.
#function step2B(boardArray)
#    println("2. Step: Filter all invalid board states.")
#    validBoardArray = filter(boardState->(abs(count(i->(i=='X'),boardState) - count(i->(i=='O'),boardState)) < 2), boardArray)
#    println("VersionB: ")
#    println("> ", length(validBoardArray), "/", length(boardArray), " = ", (length(validBoardArray)/length(boardArray))*100, "% are valid.")
#    return validBoardArray
#end

validBoardArray = step2A(copy(boardArray))
println("> ", length(validBoardArray), "/", length(boardArray), " = ", round((length(validBoardArray) / length(boardArray)) * 100, digits=2), "% are valid.")
println("> ", "E.g.: ", validBoardArray[rand(1:length(validBoardArray))])
#@time versionB(copy(boardArray))


function step3(validBoardArray)
    println("3. Step: Find all winning board states.")

    # Winnings in a row
    winX = filter(i -> ('X' == i[1] == i[2] == i[3]), validBoardArray)
    append!(winX, filter(i -> ('X' == i[4] == i[5] == i[6]), validBoardArray))
    append!(winX, filter(i -> ('X' == i[7] == i[8] == i[9]), validBoardArray))

    # Winnings in a column
    append!(winX, filter(i -> ('X' == i[1] == i[4] == i[7]), validBoardArray))
    append!(winX, filter(i -> ('X' == i[2] == i[5] == i[8]), validBoardArray))
    append!(winX, filter(i -> ('X' == i[3] == i[6] == i[9]), validBoardArray))

    # Winnings in a diagonal
    append!(winX, filter(i -> ('X' == i[1] == i[5] == i[9]), validBoardArray))
    append!(winX, filter(i -> ('X' == i[3] == i[5] == i[7]), validBoardArray))

    # Winnings in a row
    winO = filter(i -> ('O' == i[1] == i[2] == i[3]), validBoardArray)
    append!(winO, filter(i -> ('O' == i[4] == i[5] == i[6]), validBoardArray))
    append!(winO, filter(i -> ('O' == i[7] == i[8] == i[9]), validBoardArray))

    # Winnings in a column
    append!(winO, filter(i -> ('O' == i[1] == i[4] == i[7]), validBoardArray))
    append!(winO, filter(i -> ('O' == i[2] == i[5] == i[8]), validBoardArray))
    append!(winO, filter(i -> ('O' == i[3] == i[6] == i[9]), validBoardArray))

    # Winnings in a diagonal
    append!(winO, filter(i -> ('O' == i[1] == i[5] == i[9]), validBoardArray))
    append!(winO, filter(i -> ('O' == i[3] == i[5] == i[7]), validBoardArray))

    @show length(winX)
    @show length(winO)

    open("winX.csv", "w") do io
        writedlm(io, winX)
    end

    open("winO.csv", "w") do io
        writedlm(io, winO)
    end
end

step3(copy(validBoardArray))
