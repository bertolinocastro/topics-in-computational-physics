function ret=euler(f,f0,h,k)
   x=[]
   y=[]
   xi=0
   for i=1:k do
      // disp('k',k)
      xi = xi + h
      f0 = f0 + h*f(xi)
      x=[x,xi]
      y=[y,f0]
   end
   ret = [x;y]
endfunction

for k=50:50 do
   a = euler(exp,1,0.1,k)
   x = a(1,1:$)
   y = a(2,1:$)
   plot(x,exp(x),'b-')
   plot(x,y,'k.')
end
