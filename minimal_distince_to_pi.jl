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

function minimalDistanceToPi(min::Int64, max::Int64)
    i = getSize()
    numerator,denominator= 0,0
    while (denominator < min || denominator > max) && i >= 1
        numerator,denominator = cal(i)
        i = i - 1
        # println("denominator=$denominator")
    end
    "$numerator/$denominator"
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

