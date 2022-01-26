function minimalDistanceToPi(min::Int64, max::Int64)
    distance = 0
    result = ""
    array_abs = []
    array = []
    for i = min:max
        lower = Int(floor(i*pi))
        upper = Int(floor(i*pi)+1)
        # println("lower=$lower, upper=$upper")
        # lower_abs = abs(lower/i-pi)
        # upper_abs = abs(upper/i-pi)
        # theminone = minimum([lower_abs,upper_abs])
        # (distance, result) = (iszero(distance) || theminone < distance) ? (theminone,isequal(lower_abs, theminone) ? "$lower/$i" : "$upper/$i"  ) : (distance, result)
        push!(array_abs, abs(lower/i-pi))
        push!(array_abs, abs(upper/i-pi))
        push!(array, "$lower/$i")
        push!(array, "$upper/$i")
    end
    println("min: ", minimum(array_abs))
    println("index=", indexin(array_abs, minimum(array_abs)))
    array[indexin(array_abs, minimum(array_abs))]
    # result
end

# ---sample start---
# 221014255319169 221014935871432
# 482480 1196809
# minimalDistanceToPi(482480,1196809)
# ---sample end---


function logmin(vect :: Vector{Float64}, startindex::Int64, endindex::Int64)
    # v = vect[startindex:endindex]
    if isempty(vect) ==true return (-1, nothing)
    elseif  length(vect[startindex:endindex]) == 1 return (startindex, vect[startindex])
    elseif length(vect[startindex:endindex]) == 2 return ( (isequal(vect[startindex], min(vect[startindex],v[endindex])) ? vect[startindex] : vect[endindex] ),   min(vect[startindex],vect[endindex]))
    else 
        midindex = isequal(length(v) % 2, 0)
        (leftindex,leftval) = logmin(vect, startindex, startindex+Int(length(v)/2)-1)
        (rightindex,rightval) = logmin(vect, startindex+Int(length(v)/2), endindex)
        println("leftval=$leftval, rightval=$rightval")
        # resu = (isequal(leftval,min(leftval, rightval)) == true) ? (leftindex, leftval):(rightindex, rightval)
        return (-1,-3)
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
    # result = minimalDistanceToPi(parse(Int64,s[1:(index-1)]),parse(Int64,  s[(index+1):end]))
    # println("result = $result")
end

# __init__()

vvvv = [1.2,2.2,3.4,1.1,1.2,567.645]
println(logmin(vvvv, 1, lastindex(vvvv)))

