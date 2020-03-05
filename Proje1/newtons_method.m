function[abs_error,new_guessX,newF,iter] = newtons_method(f,df,bounds,tolerance)

%setting tolerance and max iterations
max_iterations = 100;


%initilization
p0 = bounds(1);
iter = 1;
while (iter <= max_iterations)
  %Computation of p
  q0 = f(p0);
  df_q0 = df(p0);
  new_guessX = p0 -(q0/df_q0);
  
  newF =f(new_guessX);
  abs_error = abs(new_guessX - p0);

  if ( abs_error < tolerance)
      break;
  end
  %increment iteration index
  iter = iter+1;
  p0 = new_guessX;
end
end