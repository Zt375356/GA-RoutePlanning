function [ newgenx,newgeny ] = jiaocha( genx,geny,pa,fitvalue,xobs,yobs,robs,xs,ys,xt,yt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% jiaocha�������������
% genx genyΪ��Ⱥ  pa �������
% newgenx newgeny��������Ⱥ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [maxfitvalue,maxvalueindex] = max(fitvalue);
    [gensizex,gensizey] = size(genx);         %��ȡ��Ⱥ��ά�� genx ��Ⱥ����
    newgenx = zeros(gensizex,gensizey);       %��ʼ������Ⱥ
    newgeny = zeros(gensizex,gensizey);       %��ʼ������Ⱥ
    newgenx(1,:) = genx(maxvalueindex,:);     %�������Ÿ���
    newgeny(1,:) = geny(maxvalueindex,:);
    genx(maxvalueindex,:) = genx(1,:);        %�滻���Ÿ���
    geny(maxvalueindex,:) = geny(1,:);
    genx(1,:) = newgenx(1,:);
    geny(1,:) = newgenx(1,:);
    for i = 2:2:gensizex-1
        pat = rand(1);             %���������
        if pat<=pa                 %��������
            a = rand(1);           %�������
            xx1 = a*genx(i,:)+(1-a)*genx(i+1,:);
            xx2 = a*genx(i+1,:)+(1-a)*genx(i,:);
            yy1 = a*geny(i,:)+(1-a)*geny(i+1,:);
            yy2 = a*geny(i+1,:)+(1-a)*geny(i,:);
            newgenx(i,:) = xx1;    %������������
            newgenx(i+1,:) = xx2;
            newgeny(i,:) = yy1;
            newgeny(i+1,:) = yy2;
        else                       %������
            newgenx(i,:) = genx(i,:);%ֱ�ӱ�������
            newgenx(i+1,:) = genx(i+1,:);
            newgeny(i,:) = geny(i,:);
            newgeny(i+1,:) = geny(i+1,:);
        end
    end
end