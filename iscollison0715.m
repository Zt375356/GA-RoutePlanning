function [output]=iscollison0715(gentheta,genxx,genyy,xobs,yobs,robs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% iscollison0715()：用于判断dubins曲线是否与障碍物碰撞,每一段曲线采样点为100
% 
% genxx genyy为包含起始点和终点的种群
% xobs，yobs，robs为障碍物圆心和半径
% output 返回一个（gensize，1）数组为0 发生碰撞 为1不碰撞
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[sizex,sizey] = size(genxx);
output = 1*ones(sizex,1);
for i = 1:sizex         % 循环每个个体
    path=dubins_curve0714(gentheta(i,:),genxx(i,:),genyy(i,:));
    [pathLen,XX]  = size(path);
    for t=1:length(xobs) %对dubins曲线遍历每一个障碍物
        fcoll = @(x,y)((x-xobs(t)).^2+(y-yobs(t)).^2-robs(t).^2);
        for k = 1: pathLen %对每个点进行遍历
            if (fcoll(path(k,1),path(k,2))<=0)
                output(i)=0;%产生碰撞
                break;
            end
        end
    end
end