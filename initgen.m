function [ genx ,geny ] = initgen(sizegen,n,lim,xobs,yobs,robs,xs,ys,xt,yt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%initgen():��ʼ������ sizegen:��Ⱥ��С
% xobs��yobs��robsΪ�ϰ���Բ�ĺͰ뾶
%n:ÿ�������Ⱦɫ����Ŀ lim:��Χ[xmin xmax ymin ymax]
%genx\geny����ʼ����Ⱥ ÿһ��Ϊһ������(genx �� geny)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
genx = zeros(sizegen,n);             %��ʼ����Ⱥ
geny = zeros(sizegen,n);
for tt = 1:sizegen                   %ѭ�� �������·��
  genxx1 = lim(1) + (lim(2)-lim(1))*rand(1,n);
  genyy1 = lim(3) + (lim(4)-lim(3))*rand(1,n);
  while(1)
      if(iscollison([xs genxx1 xt],[ys genyy1 yt],xobs,yobs,robs)~=0)
          break;                     %·�����ϰ�����ײ����������
      end
      genxx1 = lim(1) + (lim(2)-lim(1))*rand(1,n);
      genyy1 = lim(3) + (lim(4)-lim(3))*rand(1,n);
  end
  genx(tt,:) = genxx1;               %����·��
  geny(tt,:) = genyy1;
end
end

