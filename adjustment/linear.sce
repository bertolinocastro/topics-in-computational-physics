function a=leastsquares(x,y)
    n = length(x)
    a = (sum(x.*y)-sum(x).*sum(y)./n)/(sum(x.*x)-sum(x)^2./n)
    b = (sum(y)-a.*sum(x))./n
    a = [a, b]
endfunction

x = [1.00, 2.00, 3.00, 4.00, 5.00, 6.00, 7.00, 8.00]
y = [1.7, 2.5, 2.8, 3.7, 3.5, 4.4, 4.7, 5.3]

a = leastsquares(x,y)
xs = linspace(min(x),max(x),40)

disp(a)

plot(x,y,'b.')
plot(xs,xs.*a(1) + a(2),'r-')
