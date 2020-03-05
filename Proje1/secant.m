function[abs_error,new_guessX,newF,iter] = secant(f,bounds,tolerance)

%setting tolerance and max iterations
max_iterations = 100;

p0 = bounds(1);
p1 = bounds(2);
%initilization
iter = 1;
q0 = f(p0);
q1 = f(p1);

while (iter <= max_iterations)
  %Computation of p
  new_guessX = p1 - q1 *(p1-p0)/(q1-q0);
  newF =f(new_guessX);
  abs_error = abs(new_guessX - p1);


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
end

