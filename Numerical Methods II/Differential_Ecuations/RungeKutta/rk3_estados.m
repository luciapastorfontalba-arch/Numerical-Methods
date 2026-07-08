function [t, y] = rk3_estados(f, a, b, y0, n)
    % f function
    % a and b bounds of the interval
    % y0 initial condition vector
    % n number of nodes
    
    h = (b-a)/n;
    m = length(y0);
    y = zeros(m, n+1);
    y(:,1) = y0';
    t = a + h*(0:n);
    
    % Butcher tableau coefficients for the RK method
    c2 = 2/3; 
    c3 = 2/3;
    
    a21 = 2/3;
    a31 = 2/3 - 1/(4*75); 
    a32 = 1/(4*75);
    
    b1 = 1/4; 
    b2 = 3/4 - 75; 
    b3 = 75;
    
    % Bucle principal del método de Runge-Kutta
    for i = 1:n
        k1 = feval(f, t(i), y(:,i));
        k2 = feval(f, t(i) + c2*h, y(:,i) + h*(a21*k1));
        k3 = feval(f, t(i) + c3*h, y(:,i) + h*(a31*k1 + a32*k2));
        
        y(:,i+1) = y(:,i) + h*(b1*k1 + b2*k2 + b3*k3);
    end
end