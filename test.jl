interval = [	3, 7, 15, 1, 292, 1, 1, 1, 2, 1, 3, 1, 14, 2, 1, 1, 2, 2, 2, 2, 1, 84, 2, 1, 1, 15, 3, 13, 1, 4, 2, 6, 6, 99, 1, 2, 2, 6, 3, 5, 1, 1, 6, 8, 1, 7, 1, 2, 3, 7, 1, 2, 1, 1, 12, 1, 1, 1, 3, 1, 1, 8, 1, 1, 2, 1, 6, 1, 1, 5, 2, 2, 3, 1, 2, 4, 4, 16, 1, 161, 45, 1, 22, 1, 2, 2, 1, 4, 1, 2, 24, 1, 2, 1, 3, 1, 2, 1]

#次函数测试根据euler公式推出的pi的连分数形式，再计算出小数结果
function test_minimal_distince_to_pi(size::Int64)
    a, cons, sum, i = 0 ,0 ,0, size
    while i >= 1
        if i == 1
            a = 4
            cons = 1
        else
            a = (2(i-1)-1)^2
            cons = 2
        end
        sum = a/(cons+sum)
        i = i - 1
    end
    sum
end

function __init__()
    s = readline()
    for i = 1 : parse(Int64, s)
        println("i=$i")
        p, q = continued_fraction(i)
        println("i=$i, result=($p, $q), p/q = ", p/q)
    end

    # p,q = arctan_to_pi(parse(Int64, s))
    # println("p=$p, q=$q")
    # println("p/q=", p/q)
end

function continued_fraction(lower::Int64, upper::Int64)
    
end

function continued_fraction(len::Int64)
    # println("len=$len")
    p_0, p_1, q_0, q_1 = 1,interval[1], 0 , 1
    p, q = 0, 0
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
    println("p=$p, q=$q")
    p, q
end

function cal_3(len::Int64)
    if len == 1 return 8, 3 end
    p, q = (2len-1)^2, 2
    # p_1, q_1 = 0, 0
    i = len - 1
    # println("p1=$p, q1=$q")
    while i >= 1
        # p_1, q_1 = p, q        
        p, q = (2i-1)^2*q, 2q+p
        i = i - 1
    end
    p, q = 4q, p+q
    println("p=$p, q=$q")
    p, q
end


function arcsin_to_pi(n::Int64)
    sum :: BigFloat = 0.0
    for i = 0 : n
        sum += factorial(2i)/((4^i*factorial(i)^2)*(2i+1)*2^(2i+1))
    end
    6*sum
end

function arctan_to_pi(n::Int64)
    p::UInt64, q::UInt64 = 1,1
    # while i <= n
    for i = 1 : n
        # sum += (-1)^i/(2i+1)
        # p, q = (-1)
        p, q = p*(2i+1)+(-1)^i*q, q * (2i+1)
        p, q = p/gcd(p,q), q/gcd(p,q)
    end
    # 4p/gcd(4p,q), q/gcd(4p,q)
    p, q = 4p/gcd(4,q),q/gcd(4,q)
    println("p=$p, q=$q")
    p, q
end

function cal_4(n::Int64)
    # sum :: Float64 = 0.0
    p::UInt64, q::UInt64 = 1, 1
    for i = 1 : n
        # sum += 1/((4i+1)*(2i+1)*(i+1))
        p, q = p*(4i+1)*(2i+1)*(i+1)+q, q*(4i+1)*(2i+1)*(i+1)
        # println("p=$p, q=$q, gcd(p,q)=", gcd(p,q))
        p, q = p/gcd(p,q), q/gcd(p,q)
        # println("p=$p, q=$q")
    end
    p, q = 3p/gcd(3p,q),q/gcd(3p,q)
    println("p=$p, q=$q")
    p, q
end

__init__()
