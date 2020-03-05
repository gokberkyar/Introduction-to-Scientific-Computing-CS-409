clear all;close all;clc;


h=5;


tol = 1e-6;


f= @(x,y) x.* exp(-x.^2 - y.^2);
[app,iter,error]= my_Integral(f,h,tol)
