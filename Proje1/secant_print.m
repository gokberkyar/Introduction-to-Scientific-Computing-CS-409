function[abs_error,new_guessX,newF,iter] = secant_print(f,bounds,tolerance)

%setting tolerance and max iterations
max_iterations = 100;

p0 = bounds(1);
p1 = bounds(2);
%initilization
iter = 1;
q0 = f(p0);
q1 = f(p1);
disp("-----------------------------------------------------------------------------------------------------------------------")
txt = sprintf('Secant method with bounds :[%d,%d] and tolerance %.0e.\n',p0,p1,tolerance);
disp(txt)
disp(sprintf('%2s   % 20s  % 20s   % 20s  % 20s',["n","p0","p1","new_x","f(new_x)"]))
while (iter <= max_iterations)
  %Computation of p
  new_guessX = p1 - q1 *(p1-p0)/(q1-q0);
  newF =f(new_guessX);
  abs_error = abs(new_guessX - p1);
  printMatrix =[iter,p0, p1,new_guessX,newF];
  text=sprintf('%2d   % 20.10f  % 20.10f   % 20.10f  % 20.4e' , printMatrix);
  disp(text)
  if ( abs_error < tolerance)
      break;
  end
  %increment iteration index
  iter = iter+1;
  p0 = p1;
  q0 = q1;
  p1 = new_guessX;
  q1 = newF;


end
txt = sprintf('\nFinal x: % .10f f(x): %.10f iter_count = %d Abs_Error: %.2e',new_guessX,newF,iter,abs_error);
disp(txt)
disp("-----------------------------------------------------------------------------------------------------------------------")
end

