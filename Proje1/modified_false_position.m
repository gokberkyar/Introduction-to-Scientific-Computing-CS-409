function[abs_error,new_guessX,newF,iter] = modified_false_position(f,bounds,tolerance)

%setting tolerance and max iterations

max_iterations = 100;

p0 = bounds(1);
p1 = bounds(2);
%initilization
iter = 1;
q0 = f(p0);
q1 = f(p1);

counter =0;


if (q0 * q1 >0)
    disp("Wrong Interval")
else  
    %iteration 1 will be done seperated to able to calculate
    %absolute error between a2 and a1 using the loop
    iter =1;
    new_guessX = p1 - q1 *(p1-p0)/(q1-q0);
    newF =f(new_guessX);
    %if the first guess true no need to slowly converge
    if (newF == 0)
        abs_error =0;
        return;
    elseif (q1 * newF < 0)
        counter = counter+1;
        p0 = new_guessX;
        q0 = newF;
        
    elseif (q1 * newF > 0)
        p1 = new_guessX;
        q1 = newF;
        counter = counter-1;
    end
    
    
    while (iter <= max_iterations)
       %increment iteration index
      iter = iter+1;
      
      %store old guess
      old_guessX = new_guessX;
      %Computation of p
      if (counter >=2)
          q1 = q1/2;
      elseif (counter<=-2)
          q0 = q0/2;
      end
      new_guessX = p1 - q1 *(p1-p0)/(q1-q0);
      newF =f(new_guessX);
      abs_error = abs(new_guessX - old_guessX);

      if ( abs_error < tolerance)
          break;
      end
      

      if (q1 * newF < 0)
          if (counter >=0)
              counter =counter +1;
          else
              counter = 0;
          end
          
          p0 = new_guessX;
          q0 = newF;
      else
          if (counter <=0)
              counter =counter -1;
          else
              counter = 0;
          end
          
          p1 = new_guessX;
          q1 = newF;
      end
    end

end
end

