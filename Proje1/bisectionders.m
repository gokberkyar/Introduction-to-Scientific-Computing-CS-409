function[abs_error,new_guessX,newF,iter] = bisectionders(f,bounds,tolerance)

%setting tolerance and max iterations

max_iterations = 100;

iter =0;
abs_error =5; % any number just for init.


while(iter <max_iterations && abs_error>tolerance)
    %increase iteration number
    iter = iter +1;

    %values of the function at the bounds
    lbF = f(bounds(1));
    ubF = f(bounds(2));

    %new guess for the root
    new_guessX = (bounds(1) + bounds(2))/2;
    newF = f(new_guessX);

    abs_error =  abs(newF -0);
    if (abs_error < tolerance)
        break;
    else
        if (lbF * newF < 0)

            bounds(2) = new_guessX;
        elseif (lbF* newF > 0)

            bounds(1) = new_guessX;
        end
    end

end 
end

