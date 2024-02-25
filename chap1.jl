using Plots
using LaTeXStrings
using ApproxFun

plot_font = "Computer Modern"
default(fontfamily=plot_font,
        linewidth=1, framestyle=:box, label=nothing, grid=false)
scalefontsizes(1.3)

n = 16
tt = range(0, pi, n+1)
zz = exp.(1im .* tt)
xx = real(zz)
plot(zz, title="Equispaced points on the unit circle", ylim=(0, 1.1))
x = cos.(tt);
for j = 2:n
  plot!([x[j], zz[j]], linewidth=0.7, color="gray")
end
plot!(xx, 0 .* xx, color="red", seriestype=:scatter, show=false)

function ex(x)
  return sin.(6 .* x) + sign.(sin.(x + exp.(2 .* x)))
end

function interp(n::Int)
  S = Chebyshev(-1..1)
  p = points(S, n)
  v = ex(p)
  f = Fun(S, ApproxFun.transform(S, v))
  plot(p, v, color="black")
  plot!(f, color="blue", show=true)
end

interp(101)
