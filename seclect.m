function [ newgenx,newgeny ] = seclect( genx,geny,fitvalue,method)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% seclect()��ѡ�����
% genx genyΪ��Ⱥ fitvalue ��Ⱥ��Ӧ��
% method ѡ�񷽷� newgenx newgeny ��ѡ������Ⱥ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  ���̶�ѡ�񷽷�  %%%%%%%
if strcmp(method,'lunpan')
  [gensizex,gensizey] = size(genx);%��ȡ��Ⱥ��ά�� genx ��Ⱥ����
  totalfit = sum(fitvalue);        %������Ӧ���ܺ�
  p_fitvalue = fitvalue/totalfit;  %����ÿ���������Ӧ�ȸ���
  p_fitvalue = cumsum(p_fitvalue); %�ۼӺ���
  randdata = sort(rand(gensizex,1)); %��С�������� %sort��������
  newgenx = zeros(gensizex,gensizey);%��ʼ������Ⱥ
  newgeny = zeros(gensizex,gensizey);%��ʼ������Ⱥ
  fitindex = 1;                    %ѭ������
  newin = 1;                       %ѭ������
  while newin<=gensizex            %ѭ�� ���̶ķ�ѡ�����    
    if(randdata(newin))<p_fitvalue(fitindex)
        newgenx(newin,:) = genx(fitindex,:);
        newgeny(newin,:) = geny(fitindex,:);
        newin = newin+1;
    else
        fitindex = fitindex+1;
    end
  end

%%%%%%%  ������ѡ�񷽷�  %%%%%%%
elseif strcmp(method,'jinbiao')      %��������
  [gensizex,gensizey] = size(genx);  %��ȡ��Ⱥ��ά�� genx ��Ⱥ���� 
  newgenx = zeros(gensizex,gensizey);%��ʼ������Ⱥ
  newgeny = zeros(gensizex,gensizey);%��ʼ������Ⱥ
  sizeindex = round(0.5*gensizex);   %��ȡ������Ϊ��Ⱥ��С��һ��
  for i = 1:gensizex                 %ѭ����ȡ�µ���Ⱥ
    indext = round(1+rand(sizeindex,1)*(gensizex-1));%���ѡ��һ�������ĸ���
    [maxgen,indexmax] = max(fitvalue(indext));%�ҵ���Ӧ�����ĸ���
    newgenx(i,:) = genx(indexmax,:); %�����ҵ������Ÿ���
    newgeny(i,:) = geny(indexmax,:);
  end

end
end