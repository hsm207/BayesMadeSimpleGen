
"""
Computes the Maximum Apostiori Probability (MAP) given an array of outcomes
"""
function compute_map(outcomes::Array{Integer,1})

    c = counter(outcomes)

    v = collect(values(c))
    k = collect(keys(c))

    max_prob = k[argmax(v)]

    return max_prob
end

"""
Computes the Credible Interval given an array of outcome and in probability level
"""
function compute_credible_interval(
    outcomes::Array{Integer,1},
    p::Float64 = 0.95,
)::Tuple
    tail_prob = (1 - p) / 2
    quantile_markers = [tail_prob, 1 - tail_prob]
    low, high = quantile(outcomes, quantile_markers)
    return low, high
end
