function [ output ] = iscollison( genxx,genyy,xobs,yobs,robs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% iscollison()�������ж��Ƿ����ϰ�����ײ
% genx genyΪ��Ⱥ
% xobs��yobs��robsΪ�ϰ���Բ�ĺͰ뾶
% xs ys,xt,yt�ֱ�Ϊ��ʼ���Ŀ���
% output ����һ����gensize��1������Ϊ1 ������ײ Ϊ0����ײ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genxx);
output = 1*ones(sizex,1);
for i = 1:sizex         % ѭ��ÿ������
    for j = 1:sizey-1   % ѭ��ÿ��·���ķֶ�
        if(output(i)==0)
            break;
        end
        for t=1:length(xobs) %����ÿһ���ϰ���
            fcoll = @(x,y)((x-xobs(t)).^2+(y-yobs(t)).^2-robs(t).^2);
            if(strcmp(iscoll(fcoll,[genxx(i,j) genyy(i,j)],...
                    [genxx(i,j+1),genyy(i,j+1)]),'yes'))
                output(i)=0;%������ײ
                break;
            end
        end
    end
end

end

