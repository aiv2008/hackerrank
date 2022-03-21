interval = [	3, 7, 15, 1, 292, 1, 1, 1, 2, 1, 3, 1, 14, 2, 1, 1, 2, 2, 2, 2, 1, 84, 2, 1, 1, 15, 3, 13, 1, 4, 2, 6, 6, 99, 1, 2, 2, 6, 3, 5, 1, 1, 6, 8, 1, 7, 1, 2, 3, 7, 1, 2, 1, 1, 12, 1, 1, 1, 3, 1, 1, 8, 1, 1, 2, 1, 6, 1, 1, 5, 2, 2, 3, 1, 2, 4, 4, 16, 1, 161, 45, 1, 22, 1, 2, 2, 1, 4, 1, 2, 24, 1, 2, 1, 3, 1, 2, 1]

function getSize()
    length(interval)
end

function decursion(size::Int64)
    decursion(1, size)
end

function decursion(fromIndex::Int64,size::Int64)
    # interval = [	3, 7, 15, 1, 292, 1, 1, 1, 2, 1, 3, 1, 14, 2, 1, 1, 2, 2, 2, 2, 1, 84, 2, 1, 1, 15, 3, 13, 1, 4, 2, 6, 6, 99, 1, 2, 2, 6, 3, 5, 1, 1, 6, 8, 1, 7, 1, 2, 3, 7, 1, 2, 1, 1, 12, 1, 1, 1, 3, 1, 1, 8, 1, 1, 2, 1, 6, 1, 1, 5, 2, 2, 3, 1, 2, 4, 4, 16, 1, 161, 45, 1, 22, 1, 2, 2, 1, 4, 1, 2, 24, 1, 2, 1, 3, 1, 2, 1]
    # println("size of interval is :", length(interval))
    if size > length(interval) throw(BoundsError("size overflow")) end
    if size < 0 size = length(interval) end
    # sum = last(interval)
    sum = 0.0
    i = size
    # sum = last(interval[size])
    # println("fromindex=$fromIndex")
    while i >= fromIndex
    # for i =  fromIndex : size
        # sum = 1 / sum + interval[size-i]
        sum = isequal(sum, 0) ? interval[i] :  (1 / sum + interval[i])
        # println("i=$i,sum=$sum")
        i = i - 1
    end
    sum
end

function cal(size::Int64)
    # println("size=$size, length=", length(interval))
    if size > length(interval) throw(BoundsError("size overflow")) end
    if size < 0 size = length(interval) end
    if size <= 2 return (interval[1]*interval[2]+1), interval[2] end
    i = size
    numerator,denominator, i = (i % 2 == 0 ? interval[size] : 0), (i % 2 == 0 ? 0 : interval[size]), (i-1)
    while i >= 1
        ##odd is numerator where even is denominator
        if i % 2 == 0 
            # println("numerator=$numerator,interval[i]=", interval[i], ",denominator=$denominator")
            denominator += interval[i]*numerator+1
        else
            numerator += interval[i]*denominator+1
        end
        i = i - 1
    end
    println("size:$size, numerator: $numerator,denominator: $denominator")
    numerator,denominator
end

function cal_2(len::Int64)
    # println("len=$len")
    p_0::UInt64, p_1::UInt64, q_0::UInt64, q_1::UInt64 = 1,interval[1], 0 , 1
    p::UInt64, q::UInt64 = 0, 0
    for i = 1 : len
        # println("interval_$i=", interval[i])
        if i == 1
            p, q = p_1 , q_1
        else
            # println("p_0=$p_0, p_1=$p_1, q_0=$q_0, q_1=$q_1")
            p, q = interval[i]*p_1 + p_0,  interval[i]*q_1 + q_0
            # println("p=$p, q=$q")
            p_0 = p_1
            p_1 = p
            q_0 = q_1
            q_1 = q
        end
    end
    # println("p=$p, q=$q")
    # p/q
    p, q
end

function cal_3(len::Int64)
    if len == 1 return 8, 3 end
    p::UInt64, q::UInt64 = (2len-1)^2, 2
    i = len - 1
    while i >= 1
        # p_1, q_1 = p, q        
        p, q = (2i-1)^2*q, 2q+p
        i = i - 1
    end
    p, q = 4q, p+q
    # println("p=$p, q=$q")
    p, q
end

function minimalDistanceToPi(min::Int64, max::Int64)
    i = getSize()
    numerator,denominator= 0,0
    # while (denominator < min || denominator > max) && i >= 1
    #     numerator,denominator = cal_2(i)
    #     i = i - 1
    # end
    strResult = ""
    result = 1.0
    for i = 1 : getSize()
        numerator,denominator = cal_2(i)
        if denominator < min
            continue
        elseif denominator <= max
            # strResult = "$numerator/$denominator"
            if abs(numerator/denominator - pi) <  result
                result = numerator/denominator
                println("denominator=$denominator, result=$result")
                strResult = "$numerator/$denominator"
            end
        else
            break
        end
    end
    # "$numerator/$denominator"
    strResult
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

