function minimalDistanceToPi(min::Int64, max::Int64)
    # distance = 0
    # result = ""
    # array_abs = []
    # array = []
    # for i = min:max
    #     lower = Int(floor(i*pi))
    #     upper = Int(floor(i*pi)+1)
    #     push!(array_abs, abs(lower/i-pi))
    #     push!(array_abs, abs(upper/i-pi))
    #     push!(array, "$lower/$i")
    #     push!(array, "$upper/$i")
    # end
    # (index, val) = logmin(array_abs, 1, lastindex(array_abs))
    # array[index]
    den_interval = [ 1, 7, 106, 113, 33102, 33215, 66317, 99532, 265381, 364913, 1360120, 1725033, 25510582, 52746197, 78256779, 131002976, 340262731, 811528438, 1963319607, 4738167652, 6701487259, 567663097408, 1142027682075, 1709690779483, 2851718461558, 44485467702853]
    (clos_approx_str,clos_approx,numerator,denominator ) = ("",1.0,0,1)
    println("length=",length(den_interval))
    for i = 1 : length(den_interval)
        println("den_interval=",den_interval[i] )
        if den_interval[i] < min 
            continue
        elseif den_interval[i] > max
            println("over=$i")
            break
        else
            if abs(round(den_interval[i]*pi)/den_interval[i]-pi) < clos_approx
                (denominator,numerator,clos_approx) = (den_interval[i],Int(round(den_interval[i]*pi)),abs(round(den_interval[i]*pi)/den_interval[i]-pi))
                println("clos_approx=$clos_approx")
                clos_approx_str = "$numerator/$denominator"
            end
        end
    end
    clos_approx_str
end


# function logmin(vect :: Vector, startindex::Int64, endindex::Int64)
#     if  length(vect[startindex:endindex]) == 1 
#         (startindex, vect[startindex])
#     elseif length(vect[startindex:endindex]) == 2 
#         (resIndex, resVal) = ( (isequal(vect[startindex], min(vect[startindex],vect[endindex])) ? startindex : endindex ),   min(vect[startindex],vect[endindex]))
#         (resIndex, resVal)
#     else 
#         midindex = isequal(length(vect[startindex:endindex]) % 2, 0) ? Int64(length(vect[startindex:endindex]) / 2) : Int64((length(vect[startindex:endindex])-1) / 2)
#         (leftindex,leftval) = logmin(vect, startindex, startindex+midindex-1)
#         (rightindex,rightval) = logmin(vect, startindex+midindex, endindex)
#         isequal(leftval,min(leftval, rightval)) ? (leftindex, leftval) : (rightindex, rightval)
#     end
# end
   

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

