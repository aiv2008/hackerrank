interval = [	3, 7, 15, 1, 292, 1, 1, 1, 2, 1, 3, 1, 14, 2, 1, 1, 2, 2, 2, 2, 1, 84, 2, 1, 1, 15, 3, 13, 1, 4, 2, 6, 6, 99, 1, 2, 2, 6, 3, 5, 1, 1, 6, 8, 1, 7, 1, 2, 3, 7, 1, 2, 1, 1, 12, 1, 1, 1, 3, 1, 1, 8, 1, 1, 2, 1, 6, 1, 1, 5, 2, 2, 3, 1, 2, 4, 4, 16, 1, 161, 45, 1, 22, 1, 2, 2, 1, 4, 1, 2, 24, 1, 2, 1, 3, 1, 2, 1]

function getSize()
    length(interval)
end

function decursion(size::Int64)
    # interval = [	3, 7, 15, 1, 292, 1, 1, 1, 2, 1, 3, 1, 14, 2, 1, 1, 2, 2, 2, 2, 1, 84, 2, 1, 1, 15, 3, 13, 1, 4, 2, 6, 6, 99, 1, 2, 2, 6, 3, 5, 1, 1, 6, 8, 1, 7, 1, 2, 3, 7, 1, 2, 1, 1, 12, 1, 1, 1, 3, 1, 1, 8, 1, 1, 2, 1, 6, 1, 1, 5, 2, 2, 3, 1, 2, 4, 4, 16, 1, 161, 45, 1, 22, 1, 2, 2, 1, 4, 1, 2, 24, 1, 2, 1, 3, 1, 2, 1]
    # if size > length(interval) throw(BoundsError("size overflow")) end
    # if size < 0 size = length(interval) end
    # # sum = last(interval)
    # sum = last(interval[size])
    # for i =  1 : size-1
    #     sum = 1 / sum + interval[size-i]
    #     println("sum=$sum")
    # end
    # sum
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


function getFromDen(min::Int64, max::Int64)
    den_interval = [ 1, 7, 106, 113, 33102, 33215, 66317, 99532, 265381, 364913, 1360120, 1725033, 25510582, 52746197, 78256779, 131002976, 340262731, 811528438, 1963319607, 4738167652, 6701487259, 567663097408, 1142027682075, 1709690779483, 2851718461558, 44485467702853]
    clos_approx_str,clos_approx,numerator,denominator  = "",1.0,0,1
    # println("length=",length(den_interval))
    for i = 1 : length(den_interval)
        # println("den_interval=",den_interval[i] )
        if den_interval[i] < min 
            continue
        elseif den_interval[i] > max
            # println("over=$i")
            break
        else
            if abs(round(den_interval[i]*pi)/den_interval[i]-pi) < clos_approx
                denominator,numerator,clos_approx = den_interval[i],Int(round(den_interval[i]*pi)),abs(round(den_interval[i]*pi)/den_interval[i]-pi)
                # println("clos_approx=$clos_approx")
                clos_approx_str = "$numerator/$denominator"
            end
        end
    end
    clos_approx_str
end

function getFromNum(min::Int64, max::Int64)
    num_interval = [ 1, 7, 106, 113, 33102, 33215, 66317, 99532, 265381, 364913, 1360120, 1725033, 25510582, 52746197, 78256779, 131002976, 340262731, 811528438, 1963319607, 4738167652, 6701487259, 567663097408, 1142027682075, 1709690779483, 2851718461558, 44485467702853]
    clos_approx_str,clos_approx,numerator,denominator  = "",1.0,0,1
    # println("length=",length(den_interval))
    for i = 1 : length(num_interval)
        # println("den_interval=",den_interval[i] )
        if num_interval[i] < min 
            # println("11111")
            continue
        elseif num_interval[i] > max
            # println("22222")
            break
        else
            # println("33333")
            # denominator = round(num_interval[i]/pi)
            if abs(num_interval[i]/round(num_interval[i]/pi)-pi) < clos_approx
                numerator, denominator,clos_approx = num_interval[i], Int(round(num_interval[i]/pi)),abs(round(num_interval[i]/pi)/num_interval[i]-pi)
                clos_approx_str = "$numerator/$denominator"
            end
        end
    end
    clos_approx_str
end

function minimalDistanceToPi(min::Int64, max::Int64)
    # result = getFromDen(min, max)
    # if isequal("", result)
    #     result = getFromNum(Int(round(min*pi)),Int(round(max*pi)))
    # end
    # result
    i = 2
    result = decursion(2, i)  
    size = getSize()
    println("size=$size, result=$result")
    while result <= max && i <= size
        i = i + 1
        println("result=$result")
        # println("i=$i")
        result = decursion(2, i)
        if result < min continue end
    end
    # result = interval[1] + 1/result
    numer = interval[1]*result+1
    "$numer/$result"
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

