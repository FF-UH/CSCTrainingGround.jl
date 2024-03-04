module CSCTrainingGround

    export DATA_DIR 
    const DATA_DIR = joinpath(dirname(dirname(pathof(@__MODULE__))), "data")

end
