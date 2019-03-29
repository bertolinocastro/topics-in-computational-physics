// computes the n-th degree polynomial
// xp : the arbitraty point
//  n : length of input vectors
// xs : vector of x inputs
// ys : vector of y inputs
function p=Pn(xp,n,xs,ys)
    p = 0
    for i=1:n
        pr = 1
        for j=1:n
            if i==j then
                continue
            end
            pr = pr .* (xp-xs(j))./(xs(i)-xs(j))
        end        
        p = p + ys(i)*pr
    end
endfunction

x = [0,15,30,45,60,75,90]
y = [1.0,0.9659,0.8660,0.7071,0.5000,0.2588,0.0000]

// polynomial degree
n = length(x)-1

// number of interpolated points between two known ones
nP = 25

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
