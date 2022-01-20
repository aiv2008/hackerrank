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
    println("result = $result")
end

__init__()

