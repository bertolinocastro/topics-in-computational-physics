function xl=newton_raphson(x0,f,df,e)
   xl = x0 - f(x0)/df(x0)
   while abs(f(xl)) > e
      xl = xl - f(xl)/df(xl)
   end
endfunction

function y=func(x)
   y = -88.9*exp(-0.0472*x) + (17.3 + 0.527*x)
endfunction

function y=dfunc(x)
   y = 0.527+4.19608*exp(-0.0472*x)
endfunction

xm = newton_raphson(0,func,dfunc,0.1)
x = linspace(-50,50)

plot(x,func(x),'b-')
plot(xm,func(xm),'ro')
