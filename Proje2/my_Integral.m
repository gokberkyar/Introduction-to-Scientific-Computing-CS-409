function [guess,iter,currentError]= my_Integral(f,h,tol)
%Inputs
%----------------------------
%Function handler f
%h size of the triangle
%tol, tolerance for approximation

%outputs
%--------------------------------
%app, approximation for the result
%iter number of iterations used to calculate
%relative_error, final relative error


%to display longer
format long


% number of maximum iterations allowed, 11cl last around 1 minute
% increase in max_iter increases the runtime by 4.
max_iter = 15;
%setting initial value of iter
iter =1;
%setting error as -1 initially if function stops before 2 iterations
relative_error=-1;

%T calculation with giving formulas in report
%Triangle Matrix T of size 2 X 3
% T = [ P0,P1,P2] 
% P0,P1,P2 are vectex of the triangle of size 2 X 1
% P0,P1,P2 is in form [ x , y]'
% T = [ P0_x P1_x P2_x;       
%       P0_y P1_y P2_y];
x1 = h;
y1 = 0;
x2 = -h/2;
y2 = h * sqrt(3)/2;
x3 = -h/2;
y3 = -h * sqrt(3)/2;
T = [x1 x2 x3;
     y1 y2 y3];


%cell array that holds current triangles inially T is inside.
current_Triangles = {T};
%cell array that holds next triangles initially empty
next_Triangles ={};
%approximations for the integral initially empty
guess =[];
%keeps the track of triangles contributin which has error less than the 
%level tolerans
%equal to approximation if all list become empty but highly unlikely we 
%find a good approximate before the satisfiying all tolerance levels.
current_sum =0;
while iter < max_iter
    level_guess = current_sum;
    %to keep sum of the all triangles in the currrent_Triangles
    if size(current_Triangles,2) == 0
        break;
    end
    for i=1:size(current_Triangles,2)
        %extracting current triangle
        T_current = current_Triangles{i};
        %calculating its integral and updating current_sum
        current_guess = IntegralTriangle(f,T_current,h/(2^(iter-1)));
        
        level_guess= level_guess +current_guess;
        
        %calculating the next triangles
        [T1,T2,T3,T4] = subTriangles(T_current,iter);
        s1 = IntegralTriangle(f,T1,h/(2^iter));
        s2 = IntegralTriangle(f,T2,h/(2^iter));
        s3 = IntegralTriangle(f,T3,h/(2^iter));
        s4 = IntegralTriangle(f,T4,h/(2^iter));
        next_sum = s1 + s2 + s3 +s4;
        currentTol = 2* tol / 4^(iter-1);
        currentError =abs(current_guess - next_sum);
        if (currentError < currentTol)
            current_sum = current_sum + current_guess;
        else
                    %pushing new triangles to next_Triangles array
            next_Triangles{end+1} = T1;
            next_Triangles{end+1} = T2;
            next_Triangles{end+1} = T3;
            next_Triangles{end+1} = T4;
        end
        

        
        
    end
    %storing the current_sum as current_approximation
    guess(end+1)=level_guess;
    %updating the current_Triangles as next_triangles for next iter
    current_Triangles = next_Triangles;
    %clearing the next triangles
    next_Triangles = {};
    %if 2 or more iteration is calculated we can calculate
    %relative eror
     if (iter >=2)
        %absolute error calculating
        abs_error =abs(guess(end-1) - guess(end));
        %if error is half to the tolerance stop
        %explanation is report
        if (abs_error < 2*tol)
            break;
        end
%         calculating relative error
         relative_error = abs_error/ guess(end);
     end
    %increasing iter by 1
    iter = iter+1; 
end
%taking last value of estimation

%since last iteration was only for stoping the loop
iter =iter-1;
guess= guess(end);
end