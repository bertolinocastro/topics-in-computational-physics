// x: set of X coordinates as column vector
// y: set of Y coordinates as column vector
// deg: degree of polynomial adjustment
// a: list of polynomial coefficients
function a=polynomialadjust(x,y,deg)
    a = []
    for i=0:deg
        a = [a, x^i]
    end
    c = a'*a
    b = a'*y
    a = [inv(c)*b]
endfunction

// x: set of X coordinates to plot
// a: list of polynomial coefficients
// y: set of Y coordinates for the resulting polynomial
function y=ypoly(x,a)
    y = 0.
    for i=1:length(a)
        y = y + a(i).*x^(i-1)
    end
endfunction

x = [1.00, 2.00, 3.00, 4.00, 5.00, 6.00, 7.00, 8.00]'
y = [3.9, 2.7, 1.8, 2.5, 3.8, 6.5, 10.0, 14.1]'

a = polynomialadjust(x,y,2)
xs = linspace(min(x),max(x),100)

plot(x,y,'b.')
plot(xs,ypoly(xs,a),'r-')
