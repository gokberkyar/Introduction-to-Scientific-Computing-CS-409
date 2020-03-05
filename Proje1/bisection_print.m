function[abs_error,new_guessX,newF,iter] = bisection_print(f,bounds,tolerance)

%setting tolerance and max iterations

max_iterations = 100;




%checking interval
lbF = f(bounds(1));
ubF = f(bounds(2));
if (lbF * ubF >0)
    disp("Wrong Interval")
else
    
    %iteration 1 will be done seperated to able to calculate
    %absolute error between a2 and a1 using the loop
    iter =1;
        new_guessX = (bounds(1) + bounds(2))/2;
        newF = f(new_guessX);
        disp("-----------------------------------------------------------------------------------------------------------------------")
        txt = sprintf('Bisection method with bounds :[%d,%d] and tolerance %.0e.\n',bounds(1),bounds(2),tolerance);
        disp(txt)
        disp(sprintf('%2s   % 20s  % 20s   % 20s  % 20s',["n","low","up","new_x","f(new_x)"]))
        printMatrix =[iter,bounds(1) , bounds(2),new_guessX,newF];
        text=sprintf('%2d   % 20.10f  % 20.10f   % 20.10f  % 20.4e' , printMatrix);
        disp(text)
        %if the first guess true no need to slowly converge
        if (newF == 0)
            abs_error =0;
            return;
        elseif (lbF * newF < 0)
            bounds(2) = new_guessX;
        elseif (lbF* newF > 0)
            bounds(1) = new_guessX;
        end
        
        
    while(iter <max_iterations)
        %increase iteration number
        iter = iter +1;
        
        %values of the function at the bounds
        lbF = f(bounds(1));
        ubF = f(bounds(2));
        old_guessX = new_guessX;
        %new guess for the root
        new_guessX = (bounds(1) + bounds(2))/2;
        newF = f(new_guessX);
        printMatrix =[iter,bounds(1) , bounds(2),new_guessX,newF];
        text=sprintf('%2d   % 20.10f  % 20.10f   % 20.10f  % 20.1e' , printMatrix);
        disp(text)
        abs_error = abs(new_guessX - old_guessX);
        if (abs_error < tolerance)
            break;
        else
            if (lbF * newF < 0)

                bounds(2) = new_guessX;
            elseif (lbF* newF > 0)

                bounds(1) = new_guessX;
            end
        end

        old_guessX = new_guessX;

    end
   txt = sprintf('\nFinal x: % .10f f(x): %.10f iter_count = %d Abs_Error: %.2e',new_guessX,newF,iter,abs_error);
    disp(txt)
    disp("-----------------------------------------------------------------------------------------------------------------------") 
end

end