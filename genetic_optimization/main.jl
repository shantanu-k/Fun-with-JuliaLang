include("./crossover.jl")
include("./generate_pop.jl")
include("./mutation_method.jl")
include("./selection.jl")

import .Selection
import .Crossover
import .Populate
import .mutationMethod

import Random
import LinearAlgebra

function genetic_algorithm(f, population, k_max, S, C, M)
    for k in 1 : k_max
        parents = Selection.select(S, f.(population))
        children = [Crossover.crossover(C,population[p[1]],population[p[2]]) for p in parents]
        
        population .= mutationMethod.mutate.(Ref(M), children)
        # println(k)
        # println(population[argmin(f.(population))])
        # println(children)
        
    end
    population[argmin(f.(population))]
    
end
f(x) = abs(LinearAlgebra.norm(x)+43)
# f(x) = abs(x[1]^2 + x[2]^2 - 3)
m = 100
k_max = 10
population = Populate.uniformly_populated(m,[-7,-7],[7,7])
S = Selection.TruncationSelection(10)
C = Crossover.SinglePointCrossover()
M = mutationMethod.GaussianMutation(0.75)
x = genetic_algorithm(f,population,k_max, S,C,M);

println(x)
println(f(x))