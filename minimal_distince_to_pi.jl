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
    println("result=$result")
    println(abs(3126535/995207-pi))
end

# minimalDistanceToPi(482480,1196809)

# function index(s::AbstractString, inst::AbstractChar)
#     for i = 1 : length(s)
        
#     end
# end

function __init__()
    s = readline()
end
