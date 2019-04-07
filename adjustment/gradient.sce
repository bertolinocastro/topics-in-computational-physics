function g=gradient(x,y,a,vand)
    g = a*vand
    for i=1:length(a)
        a(i) = 2*sum(x^(i-1).*(g-y))
    end
    g = a
endfunction

function a=grad_adjust(x,y,alpha,a,deviation)
    vand = vandermonde(x,length(a))
    myD = mean_deviation(x,y,a)
    it = 0
    while myD > deviation
        a0 = a - alpha.*gradient(x,y,a,vand)
        lastD = mean_deviation(x,y,a0)
        if lastD >= myD
            alpha = alpha.*0.99
        else
            a = a0
            myD = lastD
        end
        it = it + 1
    end
    disp(alpha)
    disp(it)
endfunction

function r=mean_deviation(x,y,a)
    r=sqrt(sum((y-ypoly(x,a))^2))/length(x)
endfunction

function X=vandermonde(x,n)
    X = []
    for i=1:n
        X = [X; x^(i-1)]
    end
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

x = [1.00, 2.00, 3.00, 4.00, 5.00, 6.00, 7.00, 8.00]
y = [3.9, 2.7, 1.8, 2.5, 3.8, 6.5, 10.0, 14.1]

a = [0,0,0]
alpha = 1
deviation = .1

a = grad_adjust(x,y,alpha,a,deviation)
xs = linspace(min(x),max(x),100)

plot(x,y,'b.')
plot(xs,ypoly(xs,a),'r-')
