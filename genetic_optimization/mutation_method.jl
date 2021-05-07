module mutationMethod

export MutationMethod
export BitwiseMutation
export GaussianMutation
export mutate
abstract type MutationMethod end
struct BitwiseMutation <: MutationMethod
    λ
end

function mutate(M::BitwiseMutation, child)
    return [rand() < M.λ ? !v : v for v in child]
end

struct GaussianMutation <: MutationMethod
    σ
end
function mutate(M::GaussianMutation, child)
    return child + randn(length(child))*M.σ
end

end