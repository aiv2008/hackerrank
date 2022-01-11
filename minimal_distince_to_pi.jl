using Parsers

function minimalDistanceToPi(min::Int64, max::Int64)
    distance = 0
    result = ""
    for i = min:max
        # println("i = $i");
        lower = Int(floor(i*pi))
        upper = Int(floor(i*pi)+1)
        # println("lower=$lower, upper=$upper");
        for j = lower : upper
            # println("j=$j")
            if iszero(distance) || abs(j/i-pi) < distance
                distance = abs(j/i-pi)
                # result =  Rational(j,i)
                result = "$j/$i"
            end
        end
    end
    # println("distance={$distance}, result=$result")
    # println(result)
    # println(abs(result-pi)) 
    #println("result=$result")
    #println(abs(3126535/995207-pi))
    result
end

# minimalDistanceToPi(482480,1196809)

function indexof(s::AbstractString, inst::AbstractChar)
    index = 0
    for i = 1 : length(s)
        #println("s[i]=", s[i])
        if s[i] == inst
            index = i
            break;
        end
    end
    index
end

function __init__()
    s = readline()
    #println("index = ", indexof("hello world", ' '))
    index = indexof(s, ' ')
    #println("index=$index")
    #println(s[1:5])
    #println("1=", s[1:(index-1)], "2=", s[(index+1):end])
    result = minimalDistanceToPi(Parsers.parse(Int64,s[1:(index-1)]),Parsers.parse(Int64,  s[(index+1):end]))
    println("$result")
end

__init__()
