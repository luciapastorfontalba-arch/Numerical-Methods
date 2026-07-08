clc
clear all
format long

f=@(t) t*log(t.^2-1)

% approximation of f'(5) without Richardson

fprima = d1o2(f,5,10^(-3))

% approximation with Richardson

frichard = exricharsond1o2(f,5,3,2,1/100)