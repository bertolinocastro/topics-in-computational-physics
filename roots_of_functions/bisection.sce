function x0=bissec(a,b,f,e)
   x0 = (b+a)/2
   while abs(f(x0)) > e
      if f(a)*f(x0)>0 then
         a = x0
      else
         b = x0
      end
      x0 = (b+a)/2
   end
endfunction

function y=func(x)
   y = -88.9*exp(-0.0472*x) + (17.3 + 0.527*x)
endfunction

xm = bissec(10,35,func,0.1)

x = linspace(-50,50)

plot(x,func(x),'b-')
plot(xm,func(xm),'ro')
