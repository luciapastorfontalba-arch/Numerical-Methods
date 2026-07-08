clc
clear all
format long

f=@(t) t*log(t.^2-1)

% queremos aproximar a f''(5) sin Richardson

fprima = d1o2(f,5,10^(-3))

% aproximar con Richarson

frichard = exricharsond1o2(f,5,3,2,1/100)
