function[abs_error,new_guessX,newF,iter] = bisection(f,bounds,tolerance)

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
end

end