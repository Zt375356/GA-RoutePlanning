function [gentheta]=theta_cal(genxx,genyy,thetas,thetat)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% theta_cal()：计算种群的航向角
% genxx genyy为包括了起始点和终点的种群
% gentheta 为种群的航向角
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genxx);     %获取种群维度
gentheta = zeros(sizex,sizey);
gentheta(:,1)=thetas;
gentheta(:,end)=thetat;
for i = 3:sizey
    gentheta(:,i-1)=atan2(genyy(:,i) - genyy(:,i-1),genxx(:,i) - genxx(:,i-1));
end
