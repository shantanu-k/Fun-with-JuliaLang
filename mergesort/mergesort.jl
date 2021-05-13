function mergearr(Arr,l,m,r,num_sorts)
    n1 = m-l+1
    n2 = r-m
    L = zeros(n1)
    R = zeros(n2)
    for i = 1:n1
        L[i] = Arr[l+i-1]
    end
    for j = 1:n2
        R[j] = Arr[m+j]
    end
    i = 1
    j = 1
    k = l
    while i<=n1 && j<=n2
        if L[i]<=R[j]
            Arr[k] = L[i]
            i+=1
        else
            Arr[k] = R[j]
            j+=1
            num_sorts[1] += n1-i+1
        end
        k+=1
    end
    while i<=n1
        Arr[k] = L[i]
        i+=1
        k+=1
    end
    while j<=n2
        Arr[k] = R[j]
        j+=1
        k+=1
    end
end

function merge_sort(arr,l,r,num_sorts)
    if l<r

        m = Int(floor((l+(r))/2))
        merge_sort(arr,l,m,num_sorts)
        merge_sort(arr,m+1,r,num_sorts)
        mergearr(arr,l,m,r,num_sorts)
    end
end

function main(arr)
    l = 1
    r = length(arr)
    
    num_sorts = Array{Int64}(1,1)
    num_sorts[1] =0 
    merge_sort(arr,l,r,num_sorts)
    print(num_sorts[1])
end