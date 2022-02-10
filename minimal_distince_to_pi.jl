
function getFromDen(min::Int64, max::Int64)
    den_interval = [ 1, 7, 106, 113, 33102, 33215, 66317, 99532, 265381, 364913, 1360120, 1725033, 25510582, 52746197, 78256779, 131002976, 340262731, 811528438, 1963319607, 4738167652, 6701487259, 567663097408, 1142027682075, 1709690779483, 2851718461558, 44485467702853]
    (clos_approx_str,clos_approx,numerator,denominator ) = ("",1.0,0,1)
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
                (denominator,numerator,clos_approx) = (den_interval[i],Int(round(den_interval[i]*pi)),abs(round(den_interval[i]*pi)/den_interval[i]-pi))
                # println("clos_approx=$clos_approx")
                clos_approx_str = "$numerator/$denominator"
            end
        end
    end
    clos_approx_str
end

function getFromNum(min::Int64, max::Int64)
    num_interval = [ 1, 7, 106, 113, 33102, 33215, 66317, 99532, 265381, 364913, 1360120, 1725033, 25510582, 52746197, 78256779, 131002976, 340262731, 811528438, 1963319607, 4738167652, 6701487259, 567663097408, 1142027682075, 1709690779483, 2851718461558, 44485467702853]
    (clos_approx_str,clos_approx,numerator,denominator ) = ("",1.0,0,1)
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
    result = getFromDen(min, max)
    if isequal("", result)
        result = getFromNum(Int(round(min*pi)),Int(round(max*pi)))
    end
    result
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
    # result = getFromNum(parse(Int64,s[1:(index-1)]),parse(Int64,  s[(index+1):end]))
    println("$result")
end

__init__()

