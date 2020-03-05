clear all;
close all;



f1= @(x,y)  ones(size(x));
f2= @(x,y)  x;
f3= @(x,y)  exp((-x.^2+ -y.^2));
f4= @(x,y)  sin(x);
f5= @(x,y)  sin(30*x);

functions= {f1,f2,f3,f4,f5};
h_values = [5 10];
tol_values = [1e-2 1e-4];
counter=1;
for i =1: size(functions,2)
    f = functions{i};
    function_name =  func2str(f);
    for j=1:size(h_values,2)
        h = h_values(j);
        for k=1:size(tol_values,2)
            tol = tol_values(k);
            figureName = "file"+string(counter) + ".eps";
            test_integral(f,h,tol,counter);
            print('-depsc2', '-loose', figureName);
            counter = counter +2;
            
            
        end
    end
    
end





