function ret=derivative(f,f0,h,hi,k)
   x=[]
   y=[]
   xi=0
   for i=1:k do
      xi = xi + h
      f0 = recurrence(f,f0,xi,h,hi)
      x=[x,xi]
      y=[y,f0]
   end
   ret = [x;y]
endfunction

// f must be a vector
// each entry represents the derivative order starting from 0
function y=recurrence(f,f0,xi,h,hi)
   y=f0
   for i=1:hi
      y = y + h^i.*f(i,xi)./factorial(i)
   end
endfunction

// defining a function to simulate a vector of functions since Scilab does not
// have this feature
// i : function order starting from 0
// x : function argument
function f=fs(i,x)
   select i
   case 1 then
      f=exp(x)
   case 2 then
      f=exp(x)
   case 3 then
      f=exp(x)
   end
endfunction

// k steps of iteration
for k=50:50 do
   // taylor expansion with first order derivative
   a = derivative(fs,1,.1,1,k)
   x = a(1,1:$)
   y = a(2,1:$)
   plot(x,exp(x),'b-')
   plot(x,y,'ko')

   // taylor expansion with 2nd order derivative
   a = derivative(fs,1,.1,2,k)
   y = a(2,1:$)
   plot(x,y,'go')

   // taylor expansion with 3rd order derivative
   a = derivative(fs,1,.1,3,k)
   y = a(2,1:$)
   plot(x,y,'ro')
end
