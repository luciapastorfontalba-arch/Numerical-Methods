%% Ejercicio 1 operaciones poly

p= poly([-1 -1 0 2 2 5])

root= roots(p)
er0= abs(0-root(1))
er1= abs(-1-root(5))
er1neg= abs(-1-root(6))
er2=abs(2- root(3))
er2neg=abs(2-root(4))
er5= abs(5-root(2))
q= [1, -5];

m= conv(p,q)
rootb= roots(m)

[d,r]= deconv(p,q)

rootd = roots(d)

%% Ejercicio 2 LAgrange poly
x = [0, 1, 2, 3];
y = [-1, 0.5, 1, 5];

n= length(x)

q= poly(x)
L=zeros(n,n);
Lj= zeros(n,n);
q= poly(x)

for j = 1:n
    pj=poly(x(j))
    L(j,:)= deconv(q,pj )
   z= polyval(L(j,:),x(j))
   Lj(j,:)= deconv(L(j,:),z)

end


int=[0,3]
figure 
l0= @(x) polyval(Lj(1,:),x)
l1=@(x) polyval(Lj(2,:),x)
l2= @(x) polyval(Lj(3,:),x)
l3= @(x) polyval(Lj(4,:),x)
hold on


fplot(l0,int)

fplot(l1,int,'b')

fplot(l2,int,'c')

fplot(l3,int,'d')
fplot(@(x) x*0,int,'k')
legend('Poly 1','Poly 2', 'Poly 3', 'Poly 4')
grid on

hold off


p=0;
for j=1:n

p= p+ Lj(j,:)*y(j);

end
p

p_fun= @(x) polyval(p,x);
figure
hold on

fplot(p_fun,int)
fplot(@(x) x*0,int)
plot(x,y,"Marker","o","Color","r","LineStyle","none")
legend('p')
hold off




%% Ejercicio 3 Lagrange poly polfit

x=linspace(-3,1,8)
f = @(x) 3*cos(3-3*x+4*x.^2)
y= 3*cos(3-3*x+4*x.^2)


p = polyfit(x,y,n-1)
int=[-1,1]
p_fun= @(x) polyval(p,x);

figure
hold on

fplot(f,int)
fplot(p_fun,int)
legend('Función','p(x)')

hold off

p_fun(0.9)
p_fun(-0.7)

er1 = abs(p_fun(0.9)-f(0.9))
er2 = abs(p_fun(-0.7)- f(-0.7))

%Ejercicio 4 splines

x1 =linspace(-1,1,200);
y1 = interp1(x,y,x1,'spline');

figure
hold on
 
plot(x1,f(x1))
plot(x1,polyval(p,x1))
plot(x1,y1)
plot(x,y,"Marker","o","LineStyle","none")
legend('Función','p(x)', 'cubic spline')

hold off

Err= (1:200);

for i = 1:200

    Err(i)= abs(y1(i)- f(x1(i)));
end

b =  polyval(p,0.9)
a3 = p(6)
p

%% 









