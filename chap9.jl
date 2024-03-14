using Plots
using ApproxFun

x = range(-1, 1, length=1000)
y(x) = return sign.(x)
plot(x, y(x), show=false, label="sign function")

n = 99
S = Chebyshev(-1..1)
p = points(S, n)
v = y(p)
f = Fun(S, ApproxFun.transform(S, v))
plot!(f, color="blue", show=true, label="Interpolation")
