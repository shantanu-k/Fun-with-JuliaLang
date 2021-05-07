module Selection
using Random
export SelectionMethod
export TruncationSelection
export TournamentSelection
export select
abstract type SelectionMethod end

struct TruncationSelection <: SelectionMethod
    k
end

function select(t::TruncationSelection,y)
    p = sortperm(y)
    return [p[rand(1:t.k,2)] for i in y]
end

struct TournamentSelection <: SelectionMethod
    k
end

function select(t::TournamentSelection,y)
    getparent() = begin()
        p = randperm(lenght(y))
        parent = p[argmin(y[p[1:t.k]])]
    end
    return [[getparent(),getparent()] for i in y]
end

# struct RouletteWheelSelection <: SelectionMethod end
# function select(t::RouletteWheelSelection, y)
#     ?
end