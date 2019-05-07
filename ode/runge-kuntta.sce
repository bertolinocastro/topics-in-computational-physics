function ret=runge_kutta(f,f0,h,k)
   x=[]
   y=[]
   xi=0
   for i=1:k do
      xi = xi + h
      f0 = f0 + .5*h*(f(xi)+f(xi+h))
      x=[x,xi]
      y=[y,f0]
   end
   ret = [x;y]
endfunction

for k=50:50 do
   a = runge_kutta(exp,1,0.1,k)
   x = a(1,1:$)
   y = a(2,1:$)
   plot(x,exp(x),'b-')
   plot(x,y,'k.')
end
