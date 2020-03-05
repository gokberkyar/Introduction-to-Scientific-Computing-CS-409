function plotTriangle(T)

% T = [ P0,P1,P2]

temp_t = [ T(:,1) T(:,2) T(:,3) T(:,1)];
temp_x = temp_t(1,:);
temp_y = temp_t(2,:);
plot(temp_x,temp_y,"b-")
hold on
end
