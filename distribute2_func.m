%function [count6,count7,count8,limit,download,limit_1,limit_4] = distribute_func( p,j,ord)
function [download_3,limit_3] = distribute2_func( p,j,ord)            %EVENODD(p,3)不同统计交点版本
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
%%%%%版本一
% S0=[];S1=[];S2=[]; %定义空的数组
% for i=0:p-2
%     U(i+1)=i;
% end
% if j==0
%    i1=0;
% else
%    i1=mod(p-1-j,p);
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
%     i1=min(remove(U,S0,S1));
% end
% Q0=S0;    %开辟新的空间存储S0
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

%%%%%版本二
S0=[];S1=[];S2=[]; %定义空的数组
for i=0:p-2
    U(i+1)=i;
end
if j==0
   i1=0;
else
   i1=mod(p-1-j,p);
end

for M=1:p
          if(mod(2^0-1,p)==mod(2^M-1,p))
             ord=M;
             break;
          end
end
        
while length(S1)<floor((p-1)/3)
    for k=0:(ord-1)                                         %ord(2) 和p值的关系
        if mod(((i1+1)*(2^k)-1),p)==mod((p-1-j),p) 
           S0(end+1)=mod(((i1+1)*2^k-1),p);
        else 
         if (mod(((i1+1)*2^k-1),p)~=mod(p-1-2*j,p))
           S1(end+1)=mod(((i1+1)*2^k-1),p);
           if length(S1)==floor((p-1)/3)  
              if k<ord-1 && length(S0)<floor((p-1)/3)                                  %ord(2) 和p值的关系
                 S0(end+1)=(mod(((i1+1)*(2^(k+1))-1),p));
                break;
              end
           break;
           end
         end
        end
    end
    i1=min(remove(U,S0,S1));
end
%开辟新的空间存储S0
if j~=0
if (length(S0)<floor((p-1)/3))
   S0(end+1)=mod(p-1-2*j,p);
else
   S2(1)=mod(p-1-2*j,p);
end
end
while  length(S0)<floor((p-1)/3)
    Q0=S0;
    if length(Q0)==0
       Q0(end+1)=min(remove_4(U,S0,S1,S2));
    end
    for m = 1:length(Q0)
        i0=Q0(m);
        for n = 1:length(S1)
            i1=S1(n);
            i2=mod(2*i1-i0,p);
            if ismember(i2,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/3)
               S0(end+1)=i2;
               if ismember(S0(end),S0(1:end-1))==1 
                  S0(end)=[];
               end
            end
        end
    end
    if length(S0)<floor((p-1)/3)
        Q0=S0;
        for m = 1:length(Q0)
            i0=Q0(m);
            i2=mod(2*p-2-i0,p);
            if ismember(i2,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/3)
               S0(end+1)=i2;
               if ismember(S0(end),S0(1:end-1))==1 
                  S0(end)=[];
               end
            end
        end
    end
             if length(S0)==floor((p-1)/3)
                break;
             end    
end
S2=remove(U,S0,S1);

for n1=1:length(S1)
    if S1(n1)~=mod(p-1-j,p) 
        S1_1(n1)=mod(S1(n1)+j,p);
    else
        S1_1(n1)=mod(j-1,p);
    end
end

for n2=1:length(S2)
    if S2(n2)~=mod(p-1-2*j,p) 
        S2_1(n2)=mod(S2(n2)+2*j,p);
    else
        S2_1(n2)=mod(2*j-1,p);
    end
end
%%%%交点可能涉及失效列j的值——直接统计R_D、R_E、 R_F || D_E、 D_F、 E_F交点个数
%R_D
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
% %%%%%%%%%%%%%%%%% R_D_E=Ri_Dm'_En'+ Ri_Dm_I + R_En'_H
% countR_D_E=(count4-1)+(count5-1)+(count6-1);


%%%%%%%%%%%%%%%%%(evenodd(p,3))实际下载块____修复下限
%evenodd(p,3)修复下限
for n1=1:length(S1)
    if  S1(n1)==mod(p-1-j,p) && j~=0
        L1=(length(S1)-1)*(p-1)+p;
        break;
    else
        L1=length(S1)*(p-1);
    end
end

for n2=1:length(S2)
    if  S2(n2)==mod(p-1-2*j,p) && j~=0
        L2=(length(S2)-1)*(p-1)+p;
        break;
    else
        L2=length(S2)*(p-1);
    end
end

if mod((p-1),3)==0
    if(j==0)
        limit_3=(2*(p^2)-p-1)/3;
        %download_3=length(S0)*p+L1+(p-1)+L2+(p-1)-countR_D-countR_E-countD_E+countR_D_E;
    else 
        limit_3=((2*(p^2)-p-1)/3)-2;
        %download_3=length(S0)*p+L1+(p-2)+L2+(p-2)-countR_D-countR_E-countD_E+countR_D_E;
    end
else
     if(j==0)
        limit_3=(2*(p^2)-p)/3;
        %download_3=length(S0)*p+L1+(p-1)+L2+(p-1)-countR_D-countR_E-countD_E+countR_D_E;
    else 
        limit_3=((2*(p^2)-p)/3)-2;
        %download_3=length(S0)*p+L1+(p-2)+L2+(p-2)-countR_D-countR_E-countD_E+countR_D_E;
    end
end

newcount=0;
for i=0:p-2
    for j=0:p-1
        if mod(i+j,p)~=p-1 && mod(i+2*j,p)~=p-1 && ismember(mod(i+2*j,p),S2_1)==0 && ismember(mod(i+j,p),S1_1)==0 && ismember(i,S0)==0
           newcount=newcount+1;
        end
    end
end
%download_new=(p-1)*p-newcount;
download_3=(p-1)*p-newcount;
end
