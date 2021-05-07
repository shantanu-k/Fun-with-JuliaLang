module Crossover

export CrossoverMethod
export SinglePointCrossover
export crossover
abstract type CrossoverMethod end

struct SinglePointCrossover <: CrossoverMethod end
function crossover(t::SinglePointCrossover,a,b)
    i = rand(1:length(a))
    return vcat(a[1:i],b[i+1:end])

end

struct TwoPointCrossover <: CrossoverMethod end
function crossover(t::TwoPointCrossover,a,b)
    l = length(a)
    i,j = rand(1:l-1,2)
    if i > j
        j,i  = i,j
    end
    return vcat(a[1:i],b[i+1:j],a[j+1:end])
end

end