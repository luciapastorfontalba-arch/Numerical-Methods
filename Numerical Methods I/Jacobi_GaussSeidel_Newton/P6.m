%Ejercicio 1

A=[9 2;1 8];

b= [-2 1]';

    
L=tril(A,-1)%Para obtener la triangular inferior sin la diagonal principal
U=triu(A,1)%Para obtener la triangular superior sin la diagonal principal
D=diag(diag(A))


 C = -D\(L+U)
 B = D\b;
 aut=eig(C)
 p= abs(max(eig(C))) % Spectral radius
R= log(1/p) % asymptotic velocity

nor= norm(C,inf)






 %% Prueba método Jacobi
A = [-6 -5 -5; -4 -5 -5; 3 -2 -6];
b = [-54; -46; -8]; % Column Vector
% Iterative Method of Jacobi
% Initial Approximation, Tolerance, and Maximum Iterations
x0 = [0; 0; 0]; % Column Vector
tol = 1e-10;
Nmax = 7;
% We apply the Jacobi to solve this system
[x, n, errors, residuals] = metodoJacobi(A,b,x0,tol,Nmax);
x % We observe the solution obtained
A\b % We check the solution with the \ operator, it should be similar

norm2= norm(x)
norminf= norm(A*x-b,inf)

%% Ejercicio 2

 A = full(gallery('dorr',20,1));
 b = (1:20)';

x0 = zeros(20,1); 
tol = 1e-10;
Nmax = 1000;

[x, n, errors, residuals] = metodoJacobi(A,b,x0,tol,Nmax);
[x_G, n_G, err_G, res_G] = metodoGaussSeidel(A,b,x0,tol,Nmax);
x ;
x_G;
A\b;

L=tril(A,-1);
U=triu(A,1);
D=diag(diag(A));

 C_G = -(L+D)\U;

 
 p_G= abs(max(eig(C_G)))
 R_G= log(1/p_G)

 C = -D\(L+U);

 p= abs(max(eig(C))) 
R= log(1/p)
 
 nor_J = norm(x-A\b)
 nor_G=norm(x_G-A\b)

hold on
semilogy(errors, '--')
semilogy(residuals)
semilogy(err_G)
semilogy(res_G)

legend( 'Errores Jacobi', 'Residuos Jacobi','Errores Gauss-Seidel', 'Residuos Gauss-Seidel')

hold off

 % hold on
 % semilogy(errors,'--')
 % semilogy(residuals);
 % semilogy(err_G);
 % semilogy(res_G);
 % legend('Jacobi error','JAcobi residual ','GaussSeidel error', 'GaussSeider residual')
 % hold off

%% Ejercicio 3 sin fsolve

% We define the Function (column vector) 'f' of the nonlinear system f(x)=0
f = @(x) [ exp(x(1)+1)+x(1)*x(2)-1; log(x(1))-x(2)+x(3); 2*x(1)+2*x(2)-1];
% We define the Jacobian of 'f' (matrix)
Jac_f = @(x) [exp(x(1)+1)+ x(2), x(1),0; 1/x(1), -1, 1; 2,2,-1 ];

x0 = [1;-1;-1]; % Initial vector or seed x^(0)
tol = 1e-3;
Nmax = 1;
% We apply the Newton-Raphson method (improved) to solve this problem.
% Nonlinear System
[x, n, errors, residuals] = metodoNewtonSistemas(f,Jac_f,x0,tol,Nmax);
% We show the approximate solution obtained
x
nor=norm(f(x));

er= norm(f(x)-f(x0))

f(x)


%% Ejercicio 3 con fsolve
f = @(x) [ x(1).^2+x(2)-cos(x(3)); x(1)-exp(-x(2)); x(2).^3-x(3)];
x0 = [1; 1;1];
x=fsolve(f ,x0)
norma = norm(f(x))

%%

A=[2 4 -2; 4 -3 1; -2 1 -10];

b=[10 3 1]';

x0 = [0;0;0]; 
tol =1e-10;
Nmax = 7;

[x_G, n_G, err_G, res_G] = metodoGaussSeidel(A,b,x0,tol,Nmax);

nor=norm(x_G)
nor_G=norm(A*x_G-b,1)
x_G

%%

A=[-1 1 -2; 6 -5 4; -6 6 -4]
b=[7;-24; 26]

L=tril(A,-1);
U=triu(A,1);
D=diag(diag(A));

 C = -(L+D)\U;
 nor= norm(C,1)
 radioE = abs(max(eig(C)))

%%

f = @(x) [exp(x(1)+1)+x(1)*x(2)-1; log(x(1))-x(2)+x(3); 2*x(1)+2*x(2)-1 ];
x0 = [1; -1;-1];
x=fsolve(f ,x0)