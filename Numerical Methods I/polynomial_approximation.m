
% Discrete
x= linspace(0,2,8)
f =@(x) exp(x.^2)
y= 1:8;

for i=1:8
   y(i)= f(x(i));
end

q = polyfit(x,y,1)
p_fun = @(x) polyval(q,x);
%20.1985x   -8.8941

q =polyfit(x,y,3)
q_fun = @(x) polyval(q,x);
%5.6766xx^3  -51.2878x^2   +26.3559x   -0.4725

t = polyfit(x,y,7)
t_fun = @(x) polyval(t,x);
%6.6709x^7  -35.7519x^6   79.8280x^5  -90.7747x^4   55.6638x^3
%-15.8601x^2+  1.9348x  +  1.0000

int=[0,2]

hold on
fplot(f, int)
fplot(p_fun,int)
fplot(q_fun,int)
fplot(t_fun,int)
plot(x,y, "Marker","o","LineStyle","none")
legend('función', 'p(x)','q(x)','t(x)', 'Nodos')
hold off

Ep = 1:8
for i=1:8
Ep(i) = abs(f(x(i))-p_fun(x(i)))
end
Epmax= max(Ep)
Ep1=Ep(1)

Eq = 1:8
for i=1:8
Eq(i) = abs(f(x(i))-q_fun(x(i)))
end
Eqmax= max(Eq)
Eq1=Eq(1)

Et = 1:8
for i=1:8
Et(i) = abs(f(x(i))-t_fun(x(i)))
end
Etmax= max(Et)
Et1=Et(1)

E = @(x) abs(f(x)-p_fun(x));

figure
hold on
fplot(E,int)
legend('Error')
hold off

%% Ejercicio 2

f = @(x) cos(2*pi*x);

n= 8
int=[-1,1]

G=zeros(n+1)

for i=1:n+1
    for j=1:n+1
     fun = @(x) (x.^(i-1))*(x.^(j-1))
    G(i,j) = integral( @(x) (x.^(i-1)).*(x.^(j-1)),-1,1)

    end
end


B=(1:n+1)
for i= 1:n+1
    b = @(x) x.^(i-1)
    p = @(x) b(x).*f(x)
    B(i)= integral(p,-1,1);

end



R= chol(G);
Y = R.' \ B.';
X= R \Y;

X = flip(X)

q= X

x1= linspace(-1,1,500);

hold on
plot(x1,polyval(q,x1))
plot(x1, f(x1))
legend('aproximation', 'funtion')
hold off

q_5=polyval(q,2.4)

a4 = q(2)


%% Polinomio 8

f = @(x) cos(2*pi*x)

n= 8
int=[-1,1]

G=zeros(n+1)

for i=1:n+1
    for j=1:n+1
     fun = @(x) (x.^(i-1))*(x.^(j-1))
    G(i,j) = integral( @(x) (x.^(i-1)).*(x.^(j-1)),-1,1)

    end
end


B=(1:n+1)
for i= 1:n+1
    b = @(x) x.^(i-1)
    p = @(x) b(x).*f(x)
    B(i)= integral(p,-1,1);

end



R= chol(G);
Y = R.' \ B.';
X= R \Y;

X = flip(X)

q= X

er0= abs(f(0)- polyval(q,0))

x1 = linspace(-1,1,200);

E = (1:200);

for i= 1:200

    E(i)= abs(f(x1(i))- polyval(q,x1(i)));
end

Ermax= max(E)


%%

format long

% Discrete
x= [1, 3, 4, 5, 7]
f =@(x) -4* cos(2 -5*x+5*x.^2);
y=  [1,5,2,2,0]



p = polyfit(x,y,2)
p_fun = @(x) polyval(q,x);
%20.1985x   -8.8941

q =polyfit(x,y,3)
q_fun = @(x) polyval(q,x);
%5.6766xx^3  -51.2878x^2   +26.3559x   -0.4725

t = polyfit(x,y,7)
t_fun = @(x) polyval(t,x);
%6.6709x^7  -35.7519x^6   79.8280x^5  -90.7747x^4   55.6638x^3
%-15.8601x^2+  1.9348x  +  1.0000

int=[-3,-1]





Eq = 1:5
for i=1:5
Eq(i) = abs(y(i)-polyval(p,x(i)))
end
Eqmax= max(Eq)
Eq1=Eq(1)



E = @(x) abs(f(x)-p_fun(x));

a= polyval(p,2)
p