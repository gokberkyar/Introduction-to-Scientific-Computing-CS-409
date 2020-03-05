function[abs_error,new_guessX,newF,iter] = newtons_method_print(f,df,bounds,tolerance)

%setting tolerance and max iterations
max_iterations = 100;


%initilization
p0 = bounds(1);
iter = 1;
disp("-----------------------------------------------------------------------------------------------------------------------")
txt = sprintf('Newtons method with bounds :[%d,%d] and tolerance %.0e.\n',bounds(1),bounds(2),tolerance);
disp(txt)
while (iter <= max_iterations)
  %Computation of p
  q0 = f(p0);
  df_q0 = df(p0);
  new_guessX = p0 -(q0/df_q0);
  
  newF =f(new_guessX);
  abs_error = abs(new_guessX - p0);
  printMatrix =[iter,p0,new_guessX,newF];
  text=sprintf('%2d   % 20.10f  % 20.10f  % 20.4e' , printMatrix);
  disp(text)
  if ( abs_error < tolerance)
      break;
  end
  %increment iteration index
  iter = iter+1;
  p0 = new_guessX;
end
txt = sprintf('\nFinal x: % .10f f(x): %.10f iter_count = %d Abs_Error: %.2e',new_guessX,newF,iter,abs_error);
disp(txt)
disp("-----------------------------------------------------------------------------------------------------------------------")
end