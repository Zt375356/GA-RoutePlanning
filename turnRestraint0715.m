function [output]=turnRestraint0715(gentheta,thetaMax)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% turnRestraint0715()：用于判断是否转弯角度约束
% gentheta 为种群的航向角
% thetaMax 为转弯限制角
% output 返回一个（gensize，1）数组 为0存在角度不合理 为1不存在角度不合理
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[sizex,sizey]=size(gentheta);
output=1*ones(sizex,1);
for i = 1:sizex
    for j = 2:sizey
        deltaTheta=gentheta(i,j)-gentheta(i,j-1);
        if (abs(deltaTheta)>thetaMax)
            output(i)=0;
            break;
        end
    end
end