
clc
clear all
format long


g = @(t) t.*cos(2.*t+9)

% queremos aproximar a g''(0) sin Richardson

gprima = d2o2(g,0,1/10)

% aproximar con Richarson

grichard = exricharsond2o2(g,0,4,3,1/5)