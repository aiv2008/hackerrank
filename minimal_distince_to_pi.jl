function minimalDistanceToPi(min::Int64, max::Int64)
    distance = 0
    result = ""
    array_abs = []
    array = []
    for i = min:max
        lower = Int(floor(i*pi))
        upper = Int(floor(i*pi)+1)
        push!(array_abs, abs(lower/i-pi))
        push!(array_abs, abs(upper/i-pi))
        push!(array, "$lower/$i")
        push!(array, "$upper/$i")
    end
    (index, val) = logmin(array_abs, 1, lastindex(array_abs))
    array[index]
end


function logmin(vect :: Vector, startindex::Int64, endindex::Int64)
    # if isempty(vect) ==true 
    #     return (-1, nothing)
    # else
    if  length(vect[startindex:endindex]) == 1 
        (startindex, vect[startindex])
    elseif length(vect[startindex:endindex]) == 2 
        (resIndex, resVal) = ( (isequal(vect[startindex], min(vect[startindex],vect[endindex])) ? startindex : endindex ),   min(vect[startindex],vect[endindex]))
        (resIndex, resVal)
    else 
        midindex = isequal(length(vect[startindex:endindex]) % 2, 0) ? Int64(length(vect[startindex:endindex]) / 2) : Int64((length(vect[startindex:endindex])-1) / 2)
        (leftindex,leftval) = logmin(vect, startindex, startindex+midindex-1)
        (rightindex,rightval) = logmin(vect, startindex+midindex, endindex)
        isequal(leftval,min(leftval, rightval)) ? (leftindex, leftval) : (rightindex, rightval)
    end
end
   

function indexof(s::AbstractString, inst::AbstractChar)
    index = 0
    for i = 1 : length(s)
        if s[i] == inst
            index = i
            break;
        end
    end
    index
end


function __init__()
    s = readline()
    index = indexof(s, ' ')
    result = minimalDistanceToPi(parse(Int64,s[1:(index-1)]),parse(Int64,  s[(index+1):end]))
    println("$result")
end

__init__()

