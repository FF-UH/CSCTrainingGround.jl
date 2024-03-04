## - - - - - - - - - - - - - - - - - - - - - - -
using CSCTrainingGround
using COBREXA
using GLPK

## - - - - - - - - - - - - - - - - - - - - - - -
# Test models are at this location
const MODELS_DIR = joinpath(DATA_DIR, "test-models")

## - - - - - - - - - - - - - - - - - - - - - - -
# Ex.1 creates a function `load_test_model` that given a models name (Ex. "iJO1366")
# loads it... see https://lcsb-biocore.github.io/COBREXA.jl/stable/examples/01_loading
function load_test_model(name)
   all_models = readdir(MODELS_DIR)
   name = name * ".json"
    
   if length(all_models) > 0
      for i in eachindex(all_models)
         if all_models[i] == name
            path = joinpath(MODELS_DIR, all_models[i])
            return load_json_model(path)
         end
      end
      print(name * " model does not exist")
      return
   end
   return
end

## - - - - - - - - - - - - - - - - - - - - - - -
# 1. Make pull request with solution
# 2. implement fva based on COBREXA.flux_balance_analysis_vec
# 3. implement fba with JuMP from CoreModel (COBREXA free)
# 4. Multi threaded fva 
# 5. reduce fva complexity from 2n * fba. linear ibjective exploration, or c-exploration.

## - - - - - - - - - - - - - - - - - - - - - - -
# Makes this holds `true`
@assert load_test_model("iJO1366") isa COBREXA.MetabolicModel

## - - - - - - - - - - - - - - - - - - - - - - -
# Ex: implementar fva... max min cada flujo...
# O sea, calcular un dos vectores xmin y xmax con los maximos y minimos
# 'reales' de cada reaccion. 
let
   # global model = load_test_model("iJO1366")
   # model = convert(CoreModel, model)

   model.c[19] = 1.0
   xmax = flux_balance_analysis_vec(model, GLPK.Optimizer)
   model.c[19] = -1.0
   xmin = flux_balance_analysis_vec(model, GLPK.Optimizer)
   # @assert sum(model.S * x .- model.b) < 1e-2
   # @assert all(model.xl <= x)
   # @assert all(model.xu >= x)
   # @show x[19]
   # c' x
end