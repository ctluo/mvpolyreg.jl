module mvpolyreg


# define a multiple variable polynomial regression function in pure julia
# 

function PolyCreate(x::Array{Float64,2}, y::Array{Float64,1}, degree::Int)
    # Check if the dimensions of x and y are compatible
    if size(x, 1) != length(y)
        error("Dimensions of x and y are not compatible.")
    end

    # Create a matrix of powers of x
    X = hcat([x .^ i for i in 0:degree]...)
    # println(X)

    # Solve the normal equations to find the polynomial coefficients
    # coeffs = (X' * X) \ (X' * y)
    coeffs = X\y

    # Return the polynomial
    return coeffs
end


end # module

# Test the function
function julia_main()
    x = rand(20, 2)
    y = x[:, 1] .^ 2 + x[:, 2]
    degree = 2
    coeff0=mvpolyreg.PolyCreate(x, y, degree)
    println(coeff0)
    # test the function
    xnew = [1.0 2.0; 2.0 3.0]
    Xnew = hcat([xnew .^ i for i in 0:degree]...)
    ynew = Xnew*coeff0
    println(ynew)
end

if abspath(PROGRAM_FILE) == @__FILE__  
    julia_main()
end