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
    # println(test_minimal_distince_to_pi(parse(Int64, s)))
    for i in 1 : parse(Int64, s)
        result = test_minimal_distince_to_pi(i)
        println("i=$i, result=$result")
    end
end

__init__()
