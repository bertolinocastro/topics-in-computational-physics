// computes the n-th degree polynomial
// xp : the arbitraty point
//  n : length of input vectors
// xs : vector of x inputs
// ys : vector of y inputs
function p=Pn(xp,xs,ys)
    p = 0
    for j=1:length(xs) do
        p = p + ai(j,1,xs,ys).*pro(j,xp,xs)
    end
endfunction

function pr=pro(j,xp,xs)
    pr = 1
    for i=1:j-1 do
        pr = pr .* (xp - xs(i))
    end
endfunction

// recursion based on "Example" section on wiki:
// https://en.wikipedia.org/wiki/Divided_differences
function a=ai(j,l,xs,ys)
    if j == 1 then
        a = ys(1)
    elseif j-l == 1 then
        a = (ys(j)-ys(l))./(xs(j)-xs(l))
    else
        a = (ai(j,l+1,xs,ys)-ai(j-1,l,xs,ys))./(xs(j)-xs(l))
    end
endfunction

x = [0,15,30,45,60,75,90]
y = [1.0,0.9659,0.8660,0.7071,0.5000,0.2588,0.0000]

/* Random equation
x = linspace(-10,10,20)
y = .01*x.^5 + .1*x.^4 -.01*x.^3 + .01*x.^2
*/

// number of interpolated points between two known ones
nP = 25

// new interpolated points
newX = []

// iterating the n-1 elements of the set of points
for i=1:length(x)-1 do
    // distance between actual two adjacent points
    dX = x(i+1)-x(i)

    // getting new x's that represent the intermediate points of nP+1 quantile inside dX
    // this will return nP-length vector
    myX = x(i)+dX./(nP+1).*(1:nP)

    // concatenating new values with old ones
    newX = [newX myX]
end

// computing y's through lagrange interpolation
newY = Pn(newX,x,y)

/* Points
disp("xs:")
disp(newX)
disp('ys:')
disp(newY)
*/

plot(x,y,'k.-')
plot(newX,newY,'b.','MarkerSize',2)
