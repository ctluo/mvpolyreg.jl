# runtests.jl
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