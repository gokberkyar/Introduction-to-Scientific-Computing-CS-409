function [T1,T2,T3,T4] = subTriangles(T,iter)
%Inputs
%-------
% T = [ P0,P1,P2] 
% P0,P1,P2 are vectex of the triangle of size 2 X 1
% P0,P1,P2 is in form [ x , y]'
% T = [ P0_x P1_x P2_x;       
%       P0_y P1_y P2_y];

%Output 4 sub triangles

%Extracting Points
P0 = T(:,1);
P1 = T(:,2);
P2 = T(:,3);
%Calculating Mid Points
P4 = (P0 + P1)/2;
P5 = (P1 + P2)/2;
P6 = (P0 + P2)/2;
%Forming new triangles using calculated and extraced points.
T1 = [P0 P4 P6];
T2 = [P5 P4 P6];
T3 = [P4 P1 P5];
T4 = [P6 P5 P2];

% for plotting purposes
if nargin == 2
    if (iter < 8)
        plotTriangle(T1);
        plotTriangle(T2);
        plotTriangle(T3);
        plotTriangle(T4);
    end
end
end