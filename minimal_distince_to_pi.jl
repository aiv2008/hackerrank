

function continued_fraction(len::Int64)
    interval = [	3, 7, 15, 1, 292, 1, 1, 1, 2, 1, 3, 1, 14, 2, 1, 1, 2, 2, 2, 2, 1, 84, 2, 1, 1, 15, 3, 13, 1, 4, 2, 6, 6, 99, 1, 2, 2, 6, 3, 5, 1, 1, 6, 8, 1, 7, 1, 2, 3, 7, 1, 2, 1, 1, 12, 1, 1, 1, 3, 1, 1, 8, 1, 1, 2, 1, 6, 1, 1, 5, 2, 2, 3, 1, 2, 4, 4, 16, 1, 161, 45, 1, 22, 1, 2, 2, 1, 4, 1, 2, 24, 1, 2, 1, 3, 1, 2, 1]
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

function arctan_to_pi(n::Int64)
    p::UInt64, q::UInt64 = 1,1
    # while i <= n
    for i = 1 : n
        p, q = p*(2i+1)+(-1)^i*q, q * (2i+1)
        p, q = p/gcd(p,q), q/gcd(p,q)
    end
    # 4p/gcd(4p,q), q/gcd(4p,q)
    p, q = 4p/gcd(4,q),q/gcd(4,q)
    println("p=$p, q=$q")
    p, q
end

function bbp(n::Int64)
    p::UInt64, q::UInt64 = 1,1
    for i = 0 : n
        println("i=$i")
        a = [(4, 8i+1),(-2, 8i+4),(-1,8i+5),(-1,8i+6)]
        p_1::UInt64, q_1::UInt64 = 0, 1
        for j in 1 : length(a)
            # println("a=", a[j][1], "b=", a[j][2])
            p_1, q_1 = (p_1*a[j][2]+a[j][1]*q_1), (q_1*a[j][2])
        end
        q_1 = 16^i*q_1
        
        p_1, q_1 = p_1/gcd(p_1,q_1), q_1/gcd(p_1, q_1)
        p, q = (p*q_1+q*p_1), (q*q_1)
        p, q = p/gcd(p,q), q/gcd(p,q)
        println("p=$p, q=$q")
    end
    p, q
end

function exeFunc(f::Function, lower::Int64, upper::Int64)
    n = 100
    min::Float64 = 1
    p, q = 0, 1
    for i = 1 : n
        # num, den = arctan_to_pi(i)
        num, den = f(i)
        if den <= upper && den >= lower
            distance :: Float64 = abs(pi-num/den)
            if distance < min
                min = distance
                println("num=$num, den=$den, distance=$distance")
                p, q  = num, den
            end
        elseif den > upper
            break
        end
    end
    p, q
end

function minimalDistanceToPi(min::Int64, max::Int64)
    p, q = exeFunc(bbp, min, max)
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
    p, q = minimalDistanceToPi(parse(Int64,s[1:(index-1)]),parse(Int64,  s[(index+1):end]))
    # p, q = arctan_to_pi(parse(Int64,s[1:(index-1)]),parse(Int64,  s[(index+1):end]))
    println("$p/$q")
end



function commFunc(lower::Int64, upper::Int64)
    # s = readline()
    # index = indexof(s, ' ')
    # upper = parse(Int64,  s[(index+1):end])
    # lower = parse(Int64,s[1:(index-1)])
    min::Float64 = 1
    p, q = 0, 1
    # for den = 1 : 1e8
    for den = lower : upper
        num :: BigInt = round(den*pi)
        distance :: Float64 = abs(pi-num/den)
        if distance < min
            min = distance
            # println("num=$num, den=$den, distance=$distance")
            p, q  = num, den
        end
    end
    p,q
end

__init__()

