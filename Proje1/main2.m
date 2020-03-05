clear all
close all
clc

f  = @(x) x.^3 + 2.*(x.^2) + 10.*x -20;
df = @(x) 3.*(x.^2) + 4.*x + 10;

tolerances = [1e-6,1e-8,1e-10];

file ='results.txt';
if exist(file, 'file') ; delete(file); end
diary(file)
bound = [0,2];
diary on
for i=1:1:3
        
        bisection_print(f,bound,tolerances(i));
        false_position_print(f,bound,tolerances(i));
        modified_false_position_print(f,bound,tolerances(i));
        secant_print(f,bound,tolerances(i));
        newtons_method_print(f,df,bound,tolerances(i));
       

end

bound = [0,10];
for i=1:1:3
        
        bisection_print(f,bound,tolerances(i));
        false_position_print(f,bound,tolerances(i));
        modified_false_position_print(f,bound,tolerances(i));
        secant_print(f,bound,tolerances(i));
        newtons_method_print(f,df,bound,tolerances(i));
       

end
diary off