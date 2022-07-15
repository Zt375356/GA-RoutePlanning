function [path]=dubins_curve0714(gentheta,genxx,genyy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dubins_curve0714()：用于生成曲线,每一段曲线采样点为100目前无法修改且转弯半径为定值
% 计划通过增加一条染色体来实现转弯半径可变
% genxx genyy为包含起始点和终点的种群
% path 返回一个（3001，3）数组，分别表示采样点数、维度（x，y，theta）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[sizex,sizey] = size(genxx);
path=[]; %储存路径
TurnRadius = 0.5;
PathStep = -1;
for j=2:sizey  %计算每一段,生成dubins曲线
    pointA=[genxx(1,j-1),genyy(1,j-1),gentheta(1,j-1)];
    pointB=[genxx(1,j),genyy(1,j),gentheta(1,j)];
    path=[path;dubins_curve(pointA,pointB, TurnRadius, PathStep)];
end
