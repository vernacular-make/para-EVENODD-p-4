% clc;
% clear;
% p=5;
% j=1;
% for M=1:p
%           if(mod(2^0-1,p)==mod(2^M-1,p))
%              ord=M;
%              break;
%           end
% end
% [n1_D,n2_L] = distribute_func( p,j,ord)
% 
% S0=[];S1=[];S2=[]; %����յ�����
% for i=0:p-2
%     U(i+1)=i;
% end
% if j==0
%    i1=0;
% else
%    i1=mod(p-1-2*j,p);
% end
% while length(S1)<floor((p-1)/3)
%     for k=0:(ord-1)                                         %ord(2) ��pֵ�Ĺ�ϵ
%         if mod(((i1+1)*(2^k)-1),p)==mod((p-1-j),p) 
%           S0(end+1)=mod(((i1+1)*2^k-1),p);
%           if ismember(S0(end),S0(1:end-1))==1
%               S0(end)=[];
%           end
%         else 
%           S1(end+1)=mod(((i1+1)*2^k-1),p);
%           if length(S1)>=2
%               if ismember(S1(end),S1(1:end-1))==1 
%                  S1(end)=[];
%               end
%           end
%           if length(S1)==floor((p-1)/3)  
%              if k<ord-1                                     %ord(2) ��pֵ�Ĺ�ϵ
%                 S0(end+1)=(mod(((i1+1)*(2^(k+1))-1),p));
%                 break;
%              end
%           end
%         end
%     end
%       i1=min(remove(U,S0,S1));
% end
% Q0=S0;    %�����µĿռ�洢S0
% 
% 
% while  length(S0)<floor((p-1)/3)
%     if length(Q0)==0
%        Q0(end+1)=min(remove(U,S0,S1));
%     end
%     for m = 1:length(Q0)
%         i0=Q0(m);
%         for n = 1:length(S1)
%             i1=S1(n);
%             i2=mod(2*i1-i0,p);
%             if ismember(i2,remove(U,S0,S1))==1 && length(S0)<floor((p-1)/3)
%                S0(end+1)=i2;
%                if ismember(S0(end),S0(1:end-1))==1 
%                   S0(end)=[];
%                end
%             end
%         end
%     end
%     if length(S0)<floor((p-1)/3)
%         Q0=S0;
%         for m = 1:length(Q0)
%             i0=Q0(m);
%             i2=mod(2*p-2-i0,p);
%             if ismember(i2,remove(U,S0,S1))==1 && length(S0)<floor((p-1)/3)
%                S0(end+1)=i2;
%                if ismember(S0(end),S0(1:end-1))==1 
%                   S0(end)=[];
%                end
%             end
%         end
%     end
%              if length(S0)==floor((p-1)/3)
%                 break;
%              end    
% end
% S2=remove(U,S0,S1);
% 
% 
% %%%%��������漰ʧЧ��j��ֵ����ֱ��ͳ��R_D��R_E�� R_F || D_E�� D_F�� E_F�������
% %R_D
% countR_D=0;                                              %Ri_D'һ���н���;Ri_H ��һ���н���;��S0(n0)ȡ��H���ǹ������ӵ�����λ�ã��Ͳ������ش�λ�õ���
% for n0=1:length(S0)
%     if mod(p-1-j,p)==S0(n0)
%         countR_D=countR_D+1;
%     end
% end
% countR_D=length(S0)*length(S1)+length(S0)-countR_D;
% 
% % R_E
% countR_E=0;
% for n0=1:length(S0)
%     if mod(p-1-2*j,p)==S0(n0)
%         countR_E=countR_E+1;
%     end
% end
% countR_E=length(S0)*length(S2)+length(S0)-countR_E;
% 
% % D_E
% %%����Dm_En�Ƿ���ܴ��ڽ��� %�������
% count1=1;
% D_E=[];
% D_EM=[];              %%�����±�
% for n1=1:length(S1)
%     i1=S1(n1);
%     if i1~=mod(p-1-j,p)
%        i1=mod(i1+j,p);
%     else
%        i1=mod(j-1,p); 
%     end
%     for n2=1:length(S2)
%         i2=S2(n2);
%           if i2~=mod(p-1-2*j,p)
%              i2=mod(i2+2*j,p);
%           else
%              i2=mod(2*j-1,p); 
%           end    
%         if mod((2*i1-i2),p)~=p-1
%             D_E(count1,:)=[S1(n1) S2(n2)];
%             if(mod(i2-i1,p)~=j)
%                D_EM(count1,:)=[mod((2*i1-i2),p) mod(i2-i1,p)];
%                count1=count1+1;
%             end
%         end
%     end
% end
% disp('****************');
% disp('D_E����ѡ��');
% disp(D_E);
% disp('D_E��������');
% disp(D_EM);
% 
% %%��������漰ʧЧ��j��ֵ
% countD_E=0;
% for n1=1:length(S1)                       %% D'm_I  
%     if S1(n1)~=mod(p-1-j,p)
%        if mod(p-1-2*j,p)==S1(n1)
%           countD_E=countD_E+1;
%        end
%     end
% end
% for n2=1:length(S2)                        %%E'n_H
%     if S2(n1)~=mod(p-1-2*j,p)
%        if mod(p-1-j,p)==S2(n2)
%           countD_E=countD_E+1;
%        end
%     end
% end
% countD_E=(count1-1)+length(S1)+length(S2)-countD_E;
% 
% %%��������漰ʧЧ��j��ֵ
% %%%%%%%%%%%%%%%%R_D_E
% % R_Dm'_E'
% R_D_E=[];
% R_D_EM=[]; 
% count4=1;
% for n0=1:length(S0)
%     if count1>1
%     for Mark=1:count1-1
%           if D_EM(Mark,1)==S0(n0)
%              R_D_E(count4,:)=[S0(n0) D_E(Mark,1) D_E(Mark,2)];
%              if(D_EM(Mark,2)~=j)
%                 R_D_EM(count4,:)=[S0(n0) D_EM(Mark,2)];
%                 count4=count4+1;
%              end
%           end  
%     end
%     end
% end
% 
% % R_Dm'_I
% R_D_I=[];
% R_D_IM=[]; 
% count5=1;
% for n1=1:length(S1) 
%     i1=S1(n1);
%     if i1~=mod(p-1-j,p)
%        i1=mod(i1+j,p);
%     else
%        i1=mod(j-1,p); 
%     end
%     if S1(n1)~=mod(p-1-2*j,p)
%        for n0=1:length(S0)
%            i0=S1(n0);
%            if i0==mod(2*i1+1,p)
%               R_D_I(count5,:)=[S0(n0) S1(n1)];
%               if mod(-i1-1,p)~=j
%                  R_D_IM(count5,:)=[mod(2*i1+1,p) mod(-i1-1,p)];
%                  count5=count5+1;
%               end
%            end
%        end
%     end
% end
% 
% % R_En'_H
% R_E_H=[];
% R_E_HM=[]; 
% count6=1;
% for n2=1:length(S2)
%     i2=S2(n2);
%     if i2~=mod(p-1-2*j,p)
%        i2=mod(i2+2*j,p);
%     else
%        i2=mod(2*j-1,p); 
%     end 
%     if S2(n2)~=mod(p-1-j,p)
%        for n0=1:length(S0)
%            i0=S0(n0);
%            if i0==mod(-2-i2,p)
%               R_E_H(count6,:)=[S0(n0) S2(n2)];
%               if mod(i2+1,p)~=j
%                 R_E_HM(count6,:)=[i0 mod(i2+1,p)];
%                 count6=count6+1;
%               else
%                  R_E_H=[];
%               end
%            end
%        end
%     end
% end
% 
% %%%%%%%%%%%%%%%%% R_D_E=Ri_Dm'_En'+ Ri_Dm_I + R_En'_H
% countR_D_E=(count4-1)+(count5-1)+(count6-1);
% 
% %%%%%%%%%%%%%%%%%(evenodd(p,3))ʵ�����ؿ�____�޸�����
% %evenodd(p,3)�޸�����
% if mod((p-1),3)==0
%     if(j==0)
%         limit_3=(2*(p^2)-p-1)/3;
%         download_3=length(S0)*p+length(S1)*(p-1)+(p-1)+length(S2)*(p-1)+(p-1)-countR_D-countR_E-countD_E+countR_D_E;
%     else 
%         limit_3=((2*(p^2)-p-1)/3)-2;
%         download_3=length(S0)*p+length(S1)*(p-1)+(p-2)+length(S2)*(p-1)+(p-2)-countR_D-countR_E-countD_E+countR_D_E;
%     end
% else
%      if(j==0)
%         limit_3=(2*(p^2)-p)/3;
%         download_3=length(S0)*p+length(S1)*(p-1)+(p-1)+length(S2)*(p-1)+(p-1)-countR_D-countR_E-countD_E+countR_D_E;
%     else 
%         limit_3=((2*(p^2)-p)/3)-2;
%         download_3=length(S0)*p+length(S1)*(p-1)+(p-2)+length(S2)*(p-1)+(p-2)-countR_D-countR_E-countD_E+countR_D_E;
%     end
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%׼ȷ��λ��������ͼ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear;
% close;
% %�Ȼ���һ����ͼ��
% %set(groot,'defaultAxesColorOrder',[0 0 0;1 0 0],...
% %      'defaultAxesLineStyleOrder','--|-|:|-.');
%     % groot refers to the graphics root object����help
%     % ��������ö���(groot)������h1��h2,����������
%     % ���û��Ƶ��ߵ���ʽ�����ǵ�˳���������õ�˳������Ϊ��
%     % ��ɫ���ߡ���ɫ���ߣ���ɫʵ�ߡ���ɫʵ�ߣ���ɫ��㡢��ɫ��㣻��ɫ���ߡ���ɫ����
% h1=axes('position',[0.08 0.1 0.85 0.85]); % ����һ������ϵ
%                                           %�� ����������½� �� ������� �ľ���ʱ���ڿ�ȵ�8%�������²�10%
%                                           %����������Ŀ�ռ85%����ռ85%��һ��С��ͳ�����
% axes(h1);                                 %��h1����Ϊ��ǰ����ϵ��Ϊ��ͼ׼��
% Z = peaks; 
% x = 1:length(Z);
% y = Z(3:10,:);
% plot(x,y);   
% axis(h1,[0,49,-6,0.5]);  %��������h1������
% %��ͼ     %x�����귶Χ��0��2�У�y�ķ�Χ��-0.5��0.5
% legend('��ɫ����','��ɫ����','��ɫʵ��','��ɫʵ��','��ɫ���','��ɫ���','��ɫ����','��ɫ����')
%  
% % ��ԭͼ�ϲ���һ���µ�Сͼ��
% %set(groot,'defaultAxesLineStyleOrder','remove','defaultAxesColorOrder','remove');
%     %ÿ��ʹ�üǵ�����ϴ����õĲ������������õĲ����ᱻ��������
% h2=axes('Position',[0.15 0.15 0.3 0.3]);
%     % �������������ԭ���ĸ������ǰɣ���˵���������������ڻ�ͼ(�㡢��)֮ǰ
% axes(h2);                  % ��h2����Ϊ��ǰ����ϵ
% %plot(rand(10,3));
% plot(x,y)
% set(h2,'xlim',[10 20]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%���н�������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc;
% clear;
% q=1;h=3;m=0;i=3;
% p=5;
% %RD
% RD_R_H=[i,mod((p-1-i),p)];
% RD_R_Dm=[i,mod((m-i),p)];
% %RE
% RE_R_I=[i,mod((p-1-i)*invert(2,p),p)];
% RE_R_Eh=[i,mod((h-i)*invert(2,p),p)];
% %RF
% RF_R_J=[i,mod((p-1-i)*invert(3,p),p)];
% RF_R_Fq=[i,mod((q-i)*invert(3,p),p)];
% %DE
% DE_Dm_Eh_=[mod((2*m-h),p),mod((h-m),p)];
% DE_H_Eh_=[mod((-2-h),p),mod((h+1),p)];
% DE_I_Dm_=[mod((2*m+1),p),mod((-m-1),p)];
% %DF
% DF_Dm_Fq_=[mod((3*m-q)*invert(2,p),p),mod((q-m)*invert(2,p),p)];
% DF_J_Dm_=[mod((3*m+1)*invert(2,p),p),mod((-m-1)*invert(2,p),p)];
% DF_H_Fq_=[mod((-3-q)*invert(2,p),p),mod((q+1)*invert(2,p),p)];
% %EF
% EF_Eh_Fq=[mod(3*h-2*q,p),mod(q-h,p)];
% EF_J_Eh_=[mod(3*h+2,p),mod(-h-1,p)];
% EF_I_Fq=[mod(-2*q-3,p),mod(q+1,p)];








