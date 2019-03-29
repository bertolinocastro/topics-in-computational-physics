x = [0,15,30,45,60,75,90]
y = [1.0,0.9659,0.8660,0.7071,0.5000,0.2588,0.0000]

// number of interpolated points between two known ones
nP = 2

// new interpolated points
newX = []
newY = []

// iterating the n-1 elements of the set of points
for i=1:length(x)-1 do
    disp('index i: '+ string(i))

    // distance between actual two adjacent points
    dX = x(i+1)-x(i)

    // getting new x's that represent the intermediate points of nP+1 quantile inside dX
    // this will return nP-length vector
    myX = x(i)+dX./(nP+1).*(1:nP)

    // computing y's through linear interpolation 
    // this will return nP-length vector
    myY = y(i) + (y(i+1)-y(i))/dX.*(myX-x(i))

    // concatenating new values with old ones
    newX = [newX myX]
    newY = [newY myY]
end

disp("xs:")
disp(newX)
disp('ys:')
disp(newY)

plot(x,y,'k.-')
plot(newX,newY,'bo')
