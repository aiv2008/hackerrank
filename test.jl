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
    for i in 1 : parse(Int64, s)
        result = test_minimal_distince_to_pi(i)
        # result = test_2(i)
        println("i=$i, result=$result")
        # println("i=$i")
    end
    # test_2(parse(Int64, s))
end


function test_2(len::Int64)
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
    p/q
end


__init__()
