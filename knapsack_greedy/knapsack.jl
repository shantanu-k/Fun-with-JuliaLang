function knapsack(arr::Array{Int},k)
    sum = k
    i = 1
    n = length(arr)
    while sum >= 0
        if sum - arr[i] > 0
            sum -=arr[i]
        elseif sum - arr[i] == 0
            return k
        elseif sum-arr[i] <0 && i<n
            i +=1
        end
    end
    return (k-sum)
end

n,k = parse.(Int,split(readline()))
arr = (parse.(Int,split(readline())))
sort!(arr,rev = true)
result = knapsack(arr,k)
println(result)