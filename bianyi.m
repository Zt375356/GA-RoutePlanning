function [ newgenx,newgeny ] = bianyi( genx,geny,pc,lim,fitvalue,xobs,yobs,robs,xs,ys,xt,yt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bianyi�������������
% genx genyΪ��Ⱥ    % pc �������
% lim ��Ⱥ��Χ
% newgenx newgeny ����Ⱥ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [maxfitvalue,maxvalueindex] = max(fitvalue);%�ҵ���Ӧ�����ĸ���
    [gensizex,gensizey] = size(genx);         %��ȡ��Ⱥ�Ĵ�С��ά��
    newgenx = zeros(gensizex,gensizey);       %��ʼ������Ⱥ
    newgeny = zeros(gensizex,gensizey);       %��ʼ������Ⱥ
    newgenx(1,:) = genx(maxvalueindex,:);     %�������Ÿ���
    newgeny(1,:) = geny(maxvalueindex,:);
    genx(maxvalueindex,:) = genx(1,:);        %�滻���Ÿ���
    geny(maxvalueindex,:) = geny(1,:);
    genx(1,:) = newgenx(1,:);
    geny(1,:) = newgenx(1,:);
    for i = 2:gensizex                        %ѭ������
        pat = rand(1);                        %���������
        if pat<=pc                            %��������
            genxline = lim(1) + (lim(2)-lim(1))*rand(1,gensizey);
            genyline = lim(3) + (lim(4)-lim(3))*rand(1,gensizey);
            newgenx(i,:) = genxline;          %�²����ĸ��屣��
            newgeny(i,:) = genyline;           
        else                                  %������
            newgenx(i,:) = genx(i,:);
            newgeny(i,:) = geny(i,:);
        end
    end
end