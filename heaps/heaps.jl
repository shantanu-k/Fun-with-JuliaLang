function max_heap(A::Array{Int64},i)
    hsize = length(A)
    lc = 2*i
    rc = 2*i+1
    if lc<=hsize && A[i]<A[lc]
        largest = lc
    else
        largest = i
    end
    if rc<=hsize && A[largest]<A[rc]
        largest = rc
    else
        largest = largest
    end
    if largest != i
        b = A[i]
        A[i] = A[largest]
        A[largest] = b
        max_heap(A,largest)
    end
end

function make_heap(A::Array{Int64})
    l = length(A)
    for i = Int(floor(l/2)):-1:1
        max_heap(A,i)
    end
    return A
end
