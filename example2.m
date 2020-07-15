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
% S0=[];S1=[];S2=[]; %定义空的数组
% for i=0:p-2
%     U(i+1)=i;
% end
% if j==0
%    i1=0;
% else
%    i1=mod(p-1-2*j,p);
% end
% while length(S1)<floor((p-1)/3)
%     for k=0:(ord-1)                                         %ord(2) 和p值的关系
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
%              if k<ord-1                                     %ord(2) 和p值的关系
%                 S0(end+1)=(mod(((i1+1)*(2^(k+1))-1),p));
%                 break;
%              end
%           end
%         end
%     end
%       i1=min(remove(U,S0,S1));
% end
% Q0=S0;    %开辟新的空间存储S0
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
% %%%%交点可能涉及失效列j的值——直接统计R_D、R_E、 R_F || D_E、 D_F、 E_F交点个数
% %R_D
% countR_D=0;                                              %Ri_D'一定有交点;Ri_H 不一定有交点;当S0(n0)取得H即是公共因子的数、位置，就不可下载此位置的数
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
% %%检验Dm_En是否可能存在交点 %交点个数
% count1=1;
% D_E=[];
% D_EM=[];              %%交点下标
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
% disp('D_E交点选择');
% disp(D_E);
% disp('D_E交点坐标');
% disp(D_EM);
% 
% %%交点可能涉及失效列j的值
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
% %%交点可能涉及失效列j的值
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
% %%%%%%%%%%%%%%%%%(evenodd(p,3))实际下载块____修复下限
% %evenodd(p,3)修复下限
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

%%%%%%%%%%%%%%%%准确定位，划分子图
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear;
% close;
% %先画第一个大图像
% %set(groot,'defaultAxesColorOrder',[0 0 0;1 0 0],...
% %      'defaultAxesLineStyleOrder','--|-|:|-.');
%     % groot refers to the graphics root object——help
%     % 这里的设置对象(groot)不能是h1或h2,否则不起作用
%     % 设置绘制点线的样式和他们的顺序，这里设置的顺序依次为：
%     % 黑色虚线、红色虚线；黑色实线、红色实线；黑色点点、红色点点；黑色点线、红色点线
% h1=axes('position',[0.08 0.1 0.85 0.85]); % 创建一个坐标系
%                                           %让 坐标轴的左下角 与 窗口左侧 的距离时窗口宽度的8%，距离下侧10%
%                                           %整个坐标轴的宽占85%，高占85%。一个小框就出来了
% axes(h1);                                 %将h1设置为当前坐标系，为绘图准备
% Z = peaks; 
% x = 1:length(Z);
% y = Z(3:10,:);
% plot(x,y);   
% axis(h1,[0,49,-6,0.5]);  %坐标轴句柄h1不能少
% %画图     %x的坐标范围是0到2π，y的范围是-0.5到0.5
% legend('黑色虚线','红色虚线','黑色实线','红色实线','黑色点点','红色点点','黑色点线','红色点线')
%  
% % 在原图上插入一个新的小图像
% %set(groot,'defaultAxesLineStyleOrder','remove','defaultAxesColorOrder','remove');
%     %每次使用记得清除上次设置的参数，否则设置的参数会被保留下来
% h2=axes('Position',[0.15 0.15 0.3 0.3]);
%     % 建立的坐标轴把原来的覆盖了是吧？这说明建立坐标轴是在绘图(点、线)之前
% axes(h2);                  % 将h2设置为当前坐标系
% %plot(rand(10,3));
% plot(x,y)
% set(h2,'xlim',[10 20]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%所有交点例举
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








