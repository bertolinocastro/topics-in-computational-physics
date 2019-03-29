// computes the n-th degree polynomial
// xp : the arbitraty point
//  n : length of input vectors
// xs : vector of x inputs
// ys : vector of y inputs
function p=Pn(xp,n,xs,ys)
    disp('xp')
    disp(xp)
    p = 0
    for i=1:n
        pr = 1
        for j=1:i-1
            pr = pr .* (xp - xs(j))
        end
        disp('pr')
        disp(pr)
        disp('--+------')
        p = p + ai(xs(1:i),ys(1:i))*pr
        disp('--+------')
    end
endfunction

// recursion based on "Example" section on wiki:
// https://en.wikipedia.org/wiki/Divided_differences
function a=ai(xs,ys)
    disp('xs')
    disp(xs)
    disp('ys')
    disp(ys)
    if length(xs) == 1 then
        a = ys(1)
        return
    end
    if length(xs) == 2 then
        a = (ys(2)-ys(1))./(xs(2)-xs(1))
        return
    end
    a = ( ai(xs(2:$),ys(2:$))-ai(xs(1:$-1),ys(1:$-1)) )./(xs($)-x(1))
endfunction

x = [0,15,30,45,60,75,90]
y = [1.0,0.9659,0.8660,0.7071,0.5000,0.2588,0.0000]

// polynomial degree
n = length(x)-1

// number of interpolated points between two known ones
nP = 2

// new interpolated points
newX = []
newY = []

// iterating the n-1 elements of the set of points
for i=1:n do
    disp('index i: '+ string(i))

    // distance between actual two adjacent points
    dX = x(i+1)-x(i)

    // getting new x's that represent the intermediate points of nP+1 quantile inside dX
    // this will return nP-length vector
    myX = x(i)+dX./(nP+1).*(1:nP)

    // computing y's through lagrange interpolation 
    // this will return nP-length vector
    myY = Pn(myX,n,x,y)

    // concatenating new values with old ones
    newX = [newX myX]
    newY = [newY myY]
end

disp("xs:")
disp(newX)
disp('ys:')
disp(newY)

plot(x,y,'k.-')
plot(newX,newY,'b.','MarkerSize',2)
