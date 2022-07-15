function [ output ] = fitvalue_cal( genxx,genyy,collision)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fitvalue_cal() ��Ӧ�ȼ���
% ��Ӧ�ȼ��� ����Ϊexp(150*1/dis*collision)-1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genxx);   %��ȡ��Ⱥ��С��ά��
dis = zeros(sizex,1);          %��ʼ������
for i = 1:sizex
    for j=1:sizey-1            %��������ÿ��·���ľ���
        dis(i)=dis(i)+sqrt((genxx(i,j+1)-genxx(i,j)).^2....
        +(genyy(i,j+1)-genyy(i,j)).^2);
    end
end                            %������Ӧ��
output = exp(150*ones(sizex,1)./dis.*collision)-1;
end

