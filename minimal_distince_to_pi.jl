function minimalDistanceToPi(min::Int64, max::Int64)
    distance = 0
    result = ""
    for i = min:max
        lower = Int(floor(i*pi))
        upper = Int(floor(i*pi)+1)
        println("lower=$lower, upper=$upper")
        theminone = minimum([abs(lower/i-pi),abs(upper/i-pi)])
        (distance, result) = (iszero(distance) || theminone < distance) ? (theminone,isequal(abs(lower/i-pi) , theminone) ? "$lower/$i" : "$upper/$i"  ) : (distance, result)
    end
    result
end

# ---sample start---
# 221014255319169 221014935871432
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

