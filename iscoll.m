function [ output ] = iscoll( f , x1 , x2 )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% iscoll()���ڼ��ÿһ��·���Ƿ����ϰ����ཻ
% f �ϰ���߽�������  x1��x2�ֱ�Ϊ�����˵�
% output���Ϊ��no�� ��û����ײ����֮
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
item = 10;                       %������Ŀ
xx = linspace(x1(1),x2(1),item); %����
yy = linspace(x1(2),x2(2),item);
output = 'no';
for index = 1:item
    if(f(xx(index),yy(index))<=0.2) %������ײ
        output = 'yes';
        break;
    end
end
end

