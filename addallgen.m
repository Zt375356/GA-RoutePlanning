function [ genxx,genyy ] = addallgen( genx,geny,xs,ys,xt,yt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% addallgen()������ʼ���Ŀ��������Ⱥ
% genx genyΪ��Ⱥ
% xs ys,xt,yt�ֱ�Ϊ��ʼ���Ŀ���
% genxx genyy ���ذ�����ʼ���Ŀ��������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genx);     %��ȡ��Ⱥά��
genxx = zeros(sizex,sizey+2);   %��ʼ��x
genxx(:,1) = ones(sizex,1)*xs;  %������ʼ��x
genxx(:,end) = ones(sizex,1)*xt;%����Ŀ���x
genxx(:,2:end-1)=genx;          %�������x
genyy = zeros(sizex,sizey+2);   %��ʼ��y
genyy(:,1) = ones(sizex,1)*ys;  %������ʼ��y
genyy(:,end) = ones(sizex,1)*yt;%����Ŀ���y
genyy(:,2:end-1)=geny;          %�������y
end