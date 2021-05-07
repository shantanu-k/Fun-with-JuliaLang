module Populate

using Distributions

export uniformly_populated
export normally_populated

function uniformly_populated(m,a,b)
    d = length(a)
    return [a+rand(d).*(b-a) for i in 1:m]
end

function normally_populated(m,μ,σ)
    D = MvNormal(μ,σ)
    return [rand(D) for i in 1:m]
end

end
