function area = IntegralTriangle(f,T,current_h)
%Inputs
%----------
%Function handler f
%Triangle Matrix T of size 2 X 3
% T = [ P0,P1,P2] 
% P0,P1,P2 are vectex of the triangle of size 2 X 1
% P0,P1,P2 is in form [ x , y]'
% T = [ P0_x P1_x P2_x;       
%       P0_y P1_y P2_y];
%current_h is size of h for this level. Since it becomes half at each level

%output
%area is integral of giving function under the triangular area
%approximated by formula decribed in the project.


%center gravity points of the triangle 
O_x =0;
O_y =0;

area =0;
for i=1:3
    %Extracting Points Pi from T matrix
    Pi = T(:,i);
    %Extracting x and y pair
    xi = Pi(1);
    yi = Pi(2);
    %Calculation of total xi and total yi
    O_x = O_x + xi;
    O_y = O_y + yi;
    %Corner points contrubition to integral
    area = area + 1/12 * f(xi,yi);
end
%Contrubition of the center of gravity to integral
area = area + 3/4 * f(O_x/3,O_y/3);
%Scaling with cofficient in front.
area = (current_h)^2 * 3 * sqrt(3) /4 * area;
end