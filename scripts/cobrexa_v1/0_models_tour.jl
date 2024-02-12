## - - - - - - - - - - - - - - - - - - - - - - -
using CSCTrainingGround
using COBREXA

## - - - - - - - - - - - - - - - - - - - - - - -
# Test models are at this location
const MODELS_DIR = joinpath(DATA_DIR, "test-models")

## - - - - - - - - - - - - - - - - - - - - - - -
# Ex.1 creates a function `load_test_model` that given a models name (Ex. "iJO1366")
# loads it... see https://lcsb-biocore.github.io/COBREXA.jl/stable/examples/01_loading
function load_test_model(name)

end

## - - - - - - - - - - - - - - - - - - - - - - -
# Makes this holds `true`
@assert load_test_model("iJO1366") isa COBREXA.MetabolicModel