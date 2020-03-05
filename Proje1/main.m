clear all
close all
clc

file ='Brief.txt';
if exist(file, 'file') ; delete(file); end
diary(file)
f  = @(x) x.^3 + 2.*(x.^2) + 10.*x -20;
df = @(x) 3.*(x.^2) + 4.*x + 10;

tolerances = [1e-6,1e-8,1e-10];
bound = [0,2];
diary on
disp('Bound [0,2]')
disp('--------------------------------------------------------------------------------------------------------------------------------------------')
diary off
for i=1:1:3
        diary on
        disp('***********')
        disp(sprintf('Tolerance = %.0e',tolerances(i)))
        disp('***********')
        diary off
        [abs_error,new_guessX,newF,iter]=bisection(f,bound,tolerances(i));
        diary on
        txt = sprintf('%25s x: % 15.10f f(x): % 20.10f    iter_count = %8d    Abs_Error: %5.2e',"Bisection",new_guessX,newF,iter,abs_error);
        disp(txt)
        diary off
        [abs_error,new_guessX,newF,iter]=false_position(f,bound,tolerances(i));
        diary on
        txt = sprintf('%25s x: % 15.10f f(x): % 20.10f    iter_count = %8d    Abs_Error: %5.2e',"False Position",new_guessX,newF,iter,abs_error);
        disp(txt)
        diary off
        [abs_error,new_guessX,newF,iter]=modified_false_position(f,bound,tolerances(i));
        diary on
        txt = sprintf('%25s x: % 15.10f f(x): % 20.10f    iter_count = %8d    Abs_Error: %5.2e',"Modified False Position",new_guessX,newF,iter,abs_error);
        disp(txt)
        diary off
        [abs_error,new_guessX,newF,iter]=secant(f,bound,tolerances(i));
        diary on
        txt = sprintf('%25s x: % 15.10f f(x): % 20.10f    iter_count = %8d    Abs_Error: %5.2e',"Secant",new_guessX,newF,iter,abs_error);
        disp(txt)
        diary off
        [abs_error,new_guessX,newF,iter]=newtons_method(f,df,bound,tolerances(i));
        diary on
        txt = sprintf('%25s x: % 15.10f f(x): % 20.10f    iter_count = %8d    Abs_Error: %5.2e',"Newtons Method",new_guessX,newF,iter,abs_error);
        disp(txt)
        diary off

end

bound = [0,10];

diary on
disp('--------------------------------------------------------------------------------------------------------------------------------------------')
fprintf('\n \n Bound [0,10] \n')
disp('--------------------------------------------------------------------------------------------------------------------------------------------')
diary off
for i=1:1:3
        diary on
        disp('***********')
        disp(sprintf('Tolerance = %.0e',tolerances(i)))
        disp('***********')
        diary off
        [abs_error,new_guessX,newF,iter]=bisection(f,bound,tolerances(i));
        diary on
        txt = sprintf('%25s x: % 15.10f f(x): % 20.10f    iter_count = %8d    Abs_Error: %5.2e',"Bisection",new_guessX,newF,iter,abs_error);
        disp(txt)
        diary off
        [abs_error,new_guessX,newF,iter]=false_position(f,bound,tolerances(i));
        diary on
        txt = sprintf('%25s x: % 15.10f f(x): % 20.10f    iter_count = %8d    Abs_Error: %5.2e',"False Position",new_guessX,newF,iter,abs_error);
        disp(txt)
        diary off
        [abs_error,new_guessX,newF,iter]=modified_false_position(f,bound,tolerances(i));
        diary on
        txt = sprintf('%25s x: % 15.10f f(x): % 20.10f    iter_count = %8d    Abs_Error: %5.2e',"Modified False Position",new_guessX,newF,iter,abs_error);
        disp(txt)
        diary off
        [abs_error,new_guessX,newF,iter]=secant(f,bound,tolerances(i));
        diary on
        txt = sprintf('%25s x: % 15.10f f(x): % 20.10f    iter_count = %8d    Abs_Error: %5.2e',"Secant",new_guessX,newF,iter,abs_error);
        disp(txt)
        diary off
        [abs_error,new_guessX,newF,iter]=newtons_method(f,df,bound,tolerances(i));
        diary on
        txt = sprintf('%25s x: % 15.10f f(x): % 20.10f    iter_count = %8d    Abs_Error: %5.2e',"Newtons Method",new_guessX,newF,iter,abs_error);
        disp(txt)
        diary off

end
