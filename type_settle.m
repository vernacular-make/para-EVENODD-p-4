%%%%%初始化1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
p=input('请输入一素数p：');
j=input('请输入系统擦除列j：');%擦除列的范围在[0,p-1];
%ord=input('请输入系统擦除列ord：')
S0=[];S1=[];S2=[];S3=[]; %定义空的数组
%length(S0); 
for i=0:p-2
    U(i+1)=i;
end

% %%%%%%%%%%%%%版本一：
% if j==0
%    i1=0;
%    i2=0;
% else
%    i1=mod(p-1-2*j,p);
%    i2=mod(p-1-3*j,p);
% end
% 
% for M=1:p
%     if(mod(2^0-1,p)==mod(2^M-1,p))
%         ord=M;
%         break;
%     end
% end
% 
% H1=[1];
% for N=1:p
%     if mod(3^N,p) < p
%        H1(end+1)=mod(3^N,p);
%        if ismember(H1(end),H1(1:end-1))==1
%            H1(end)=[];
%            break;
%        end
%     end
% end
% ord1=length(H1);
% 
% while length(S1)<floor((p-1)/4)
%     for k=0:(ord-1)                                                                 %ord(2) 和p值的关系
%         if mod(((i1+1)*(2^k)-1),p)==mod((p-1-j),p) 
%            S0(end+1)=mod(((i1+1)*2^k-1),p);
%           if ismember(S0(end),S0(1:end-1))==1                                      
%              S0(end)=[];
%           end
%         else 
%           S1(end+1)=mod(((i1+1)*2^k-1),p);                                          %m~=<p-1-j> +<p-1-2*j>
%           if length(S1)==floor((p-1)/4);
%               if ismember(S1(end),S1(1:end-1))==1 
%                  S1(end)=[];
%               end
%           end
%           if length(S1)==floor((p-1)/4)  
%              if k<ord-1                                                           %ord(2) 和p值的关系
%                 S0(end+1)=(mod(((i1+1)*(2^(k+1))-1),p));                          %S1放不下 k没结束，将与可能落在S2中一些关联数——<2m-n>=p-1,放入S0
%                 break;
%              end
%           end
%         end
%     end
%      i1=min(remove(U,S0,S1));
% end
% % S0
% % S1
%  Q1=S0; %开辟新的空间存储Q1
% % Q1
% while length(S2)<ceil((p-1)/4)
%      if length(Q1)==0
%         Q1(end+1)=min(remove(U,S0,S1));
%      end
%      for k=0:(ord1-1)                                                              %ord1(3) 和p值的关系
%            if k==0
%              S2(end+1)=mod(((i2+1)*(3^k)-1),p);                                                                        %%m~=<p-1-j> +<p-1-3*j>
%              if ismember(S2(end),S2(1:end-1))==1 || ismember(S2(end),S0(1:end))==1 || ismember(S2(end),S1(1:end))==1
%                 S2(end)=[];
%              end
%            end
%            for m = 1:length(Q1)
%                i0=Q1(m);
%               for n = 1:length(S1)
%                   i1=S1(n);
%                   if  mod(((i2+1)*(3^k)-1),p)==mod(2*i1-i0,p) || mod(((i2+1)*(3^k)-1),p)==mod(i0+2+2*j,p);  %Ri_Dm_En // Ri_En_H
%                       S2(end+1)=mod(((i2+1)*(3^k)-1),p);
%                       if ismember(S2(end),S2(1:end-1))==1 || ismember(S2(end),S0(1:end))==1 || ismember(S2(end),S1(1:end))==1
%                         S2(end)=[];
%                       end
%                  end
%              end
%            end
%         if length(S2)==ceil((p-1)/4) && length(S0)< floor((p-1)/4)
%             if k<ord1-1     
%               S0(end+1)=mod(((i2+1)*(3^(k+1))-2)*invert(2,p),p);                                                           %En_Fq \ %S2放不下 k没结束，将与可能落在S3中一些关联数——<3n-2q>=p-1,放入S0
%               if ismember(S0(end),S0(1:end-1))==1 || ismember(S0(end),S2(1:end))==1 || ismember(S0(end),S1(1:end))==1
%                  S0(end)=[];
%               end
%               break;
%             end
%         end
%     end
%     i2=min(remove_4(U,S0,S1,S2));
% end
% % S0
% % S1
% % S2
% % 
% % Q0=S0;    %为S0开辟新的空间存储Q0 (复制)
% % Q0
% % S0
%  while  length(S0)<floor((p-1)/4)
%      if length(Q0)==0
%         Q0(end+1)=min(remove_4(U,S0,S1,S2));
%      end
%      for m = 1:length(Q0)
%          i0=Q0(m);
%          for n = 1:length(S1)
%              i1=S1(n);
%              for j1=0:p-1
%                  if mod(i1+2*j1,p)==mod(i0+3*j1,p) && mod(i0+3*j1,p)==mod(j1-1,p)         %Ri_Dm_Fq_I   避免落在S3的值 取出来放入S0 i=m-j=n-2*j=（q-3*j）
%                      i3=mod(j1-1,p);
%                     if ismember(i3,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/4)
%                        S0(end+1)=i3;
%                        if ismember(S0(end),S0(1:end-1))==1 
%                        S0(end)=[];
%                        end
%                     end
%                  end
%              end
%              for j1=0:p-1
%                  if mod(i1+2*j1,p)==mod(i0+3*j1,p) && mod(i0+3*j1,p)==mod(2*j1-1,p)       %Ri_Dm_Fq_H   避免落在S3的值 取出来放入S0 i=m-j=(q-3*j)=p-1-3*j
%                     i3=mod(2*j1-1,p);
%                     if ismember(i3,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/4)
%                        S0(end+1)=i3;
%                        if ismember(S0(end),S0(1:end-1))==1 
%                           S0(end)=[];
%                        end
%                     end
%                  end
%              end
%              for f= 1:length(S2)
%                  i2=S2(f);
%                  for j1=0:p-1
%                      if mod(i2+j1,p)==mod(i1+2*j1,p) && mod(i1+2*j1,p)==mod(i0+3*j1,p)   
%                         i3=mod(i2+j1,p);                                              %Ri_Dm_En_H_Fq  避免落在S3的值 取出来放入S0 i=m-j=n-2*j=q-3*j
%                         if ismember(i3,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/4)
%                            S0(end+1)=i3;
%                            if ismember(S0(end),S0(1:end-1))==1 
%                                S0(end)=[];
%                            end
%                         end
%                      end     
%                  end  
%              end
%          end
%      end
%      
%     %S0没有填满，找瞒足的条件使得S0填满      
%     if length(S0)<floor((p-1)/4)
%         for f= 1:length(S2)
%             i2=S2(f); 
%             i3=mod(((3*i2)+1)*invert(2,p),p);                                       %En_Fq   <3n-2q>=p-1还存在的可能落在S3的值，取出分入S0中
%             if ismember(i3,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/4)   
%                 S0(end+1)=i3;
%                 if ismember(S0(end),S0(1:end-1))==1 
%                    S0(end)=[];
%                 end
%             end
%         end
%         if length(S0)<floor((p-1)/4)
%            for n = 1:length(S1)   
%                i1=S1(n);
%                i3=mod(3*i1+2,p);                                                      %Dm_Fq   <(3m-q)/2>=p-1
%                if ismember(i3,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/4)
%                   S0(end+1)=i3;
%                   if ismember(S0(end),S0(1:end-1))==1 
%                       S0(end)=[];
%                   end
%                end
%            end
%            if length(S0)<floor((p-1)/4)
%               for n = 1:length(S1)   
%                   i1=S1(n);
%                   i0=mod(2*(i1+j)+1,p);                                                     % Ri_Dm_I(单个m的值应该换成j+m)
%                   if ismember(i0,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/4)        
%                      S0(end+1)=i0;
%                      if ismember(S0(end),S0(1:end-1))==1 
%                         S0(end)=[];
%                      end
%                   end
%               end 
%               if length(S0)<floor((p-1)/4)
%                  for n = 1:length(S1)   
%                      i1=S1(n);
%                      i0=mod((3*(i1+j)+1)*invert(2,p),p);                                        % Ri_Dm_J(单个m的值应该换成j+m)
%                      if ismember(i0,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/4)       
%                          S0(end+1)=i0;
%                          if ismember(S0(end),S0(1:end-1))==1 
%                             S0(end)=[];
%                          end
%                      end
%                  end
%                  if length(S0)<floor((p-1)/4)
%                     for n = 1:length(S2)   
%                         i2=S2(n);
%                         i0=mod((3*(i2+2*j)+2),p);                                                       % Ri_En_J (单个m的值应该换成j+m)
%                         if ismember(i0,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/4)        
%                            S0(end+1)=i0;
%                           if ismember(S0(end),S0(1:end-1))==1 
%                               S0(end)=[];
%                           end
%                         end
%                     end
%                    if length(S0)<floor((p-1)/4)
%                       Q3=remove_4(U,S0,S1,S2);
%                        for n=1:length(Q3)
%                           i3=Q3(n);
%                           i0=mod(-2*(i3+3*j)-3,p);
%                           if ismember(i0,remove(remove_4(U,S0,S1,S2),-1,i3))==1 && length(S0)<floor((p-1)/4)          %Ri_Fq_I 
%                              S0(end+1)=i0;
%                              if ismember(S0(end),S0(1:end-1))==1 
%                              S0(end)=[];
%                              end
%                           end
%                        end
%                        if length(S0)<floor((p-1)/4)
%                           Q3=remove_4(U,S0,S1,S2);
%                           for n=1:length(Q3)
%                               i3=Q3(n);
%                               i0=mod((-(i3+3*j)-3)*invert(2,p),p);                                                    %Ri_Fq_H
%                               if ismember(i0,remove(remove_4(U,S0,S1,S2),-1,i3))==1 && length(S0)<floor((p-1)/4)          
%                                  S0(end+1)=i0;
%                                  if ismember(S0(end),S0(1:end-1))==1 
%                                     S0(end)=[];
%                                  end
%                               end
%                           end
%                        end  
%                     end
%                  end
%               end
%            end
%         end
%     end
%     if length(S0)==floor((p-1)/4)
%         break;
%     end
%  end
% S3=remove_4(U,S0,S1,S2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%版本二
% i2=0; 
% i2_2=0;
% H=(1);
% for M=1:p
%     if mod(2^M,p) < p
%        H(end+1)=mod(2^M,p);
%        if ismember(H(end),H(1:end-1))==1
%            H(end)=[];
%            break;
%        end
%     end
% end
% ord=length(H);
% %%%%%%%%%%%%%填满S2
% while length(S2)<ceil((p-1)/4)
%     for k=0:(ord-1)                                                               %ord(2) 和p值的关系
%         if ismember (mod(((i2+1)*2^k-1),p),remove_2(U,S2))==1 
%            S2(end+1)=mod(((i2+1)*2^k-1),p);
%         end
%         if length(S2)==ceil((p-1)/4)  
%            if k<ord-1                                                              %ord(2) 和p值的关系
%               if k<1
%                  if ismember(mod((i2+1)*(2^k)*invert(2,p),p),remove_2(U,S2))==1 
%                     S0(end+1)=mod((i2+1)*(2^k)*invert(2,p),p); 
%                  end
%               else
%                  if ismember(mod(((i2+1)*(2^(k-1))),p),remove_2(U,S2))==1               %S2放不下 k没结束，将与可能落在S1中一些关联数——<2m-n>=p-1,放入S0
%                     S0(end+1)=mod(((i2+1)*(2^(k-1))),p);       
%                  end
%               end 
%               break;
%            end
%         end
%     end
%     i2=min(remove(U,S0,S2));
% end
% % S2
% % S0
% %%%%%%%%%%%%%%%%填满S0
% while length(S0)<floor((p-1)/4)
%       Q0=S0;
%       if length(Q0)==0
%          Q0(end+1)=min(remove_2(U,S2));
%       end
%       for i= 1:length(Q0)
%           i0=Q0(i);
%              for n = 1:length(S2)
%                  i2=S2(n);
%                  if i2~=mod(p-1-2*j,p)
%                     i2=mod(i2+2*j,p);
%                  else
%                     i2=mod(2*j-1,p); 
%                  end
%                  i1=mod((i0+i2)*invert(2,p),p);    %Ri_Dm_En 把可能落到S1的值避免    
%                       if i1==mod(j-1,p) 
%                            if p<11
%                               if ismember(mod(p-1-j,p),remove(U,S0,S2))==1 %&& i1~=mod(-2-i2,p) && i1~=mod(3*i2+2,p)          %Ri_En_H  Ri_En_J  把可能落到S0的值避免(i1当i0使)
%                                  S0(end+1)=mod(p-1-j,p);
%                               end
%                            else
%                               if ismember(mod(p-1-j,p),remove(U,S0,S2))==1 && i1~=mod(-2-i2,p) && i1~=mod(3*i2+2,p) && length(S0)<floor((p-1)/4)          %Ri_En_H  Ri_En_J  把可能落到S0的值避免(i1当i0使)
%                                  S0(end+1)=mod(p-1-j,p);
%                               end
%                            end
%                         else
%                            if p<11
%                               if ismember(mod(i1-j,p),remove(U,S0,S2))==1 %&& i1~=mod(-2-i2,p) && i1~=mod(3*i2+2,p)
%                                  S0(end+1)=mod(i1-j,p);  
%                               end
%                            else
%                               if ismember(mod(i1-j,p),remove(U,S0,S2))==1  && i1~=mod(-2-i2,p) && i1~=mod(3*i2+2,p)
%                                  S0(end+1)=mod(i1-j,p);  
%                               end
%                            end
%                         end
%                   if length(S0)==floor((p-1)/4)
%                           break;
%                   end
%              end
%              if length(S0)==floor((p-1)/4)
%                 break;
%              end  
%       end
%       if length(S0)==floor((p-1)/4)
%          break;
%       end
% end
% % %%%%%%%%%%%%%%%填满S1
% while length(S1)<floor((p-1)/4)
%       for m = 1:length(S0)
%           i0=S0(m);
%           for n = 1:length(S2)
%               i2=S2(n);
%               if i2~=mod(p-1-2*j,p)
%                  i2=mod(i2+2*j,p);
%               else
%                  i2=mod(2*j-1,p); 
%               end
% %                  i2
% %                  i0
%                  i3=mod((3*i2-i0)*invert(2,p),p); 
% %                  i3
%                  %Ri_En_Fq 把可能落到S3的值避免
%                      if i3==mod(3*j-1,p) 
%                            if p<=11
%                               if ismember(mod(p-1-3*j,p),remove_4(U,S0,S2,S1))==1 %&& i3~=mod((i0-1)*invert(2,p),p) && i3~=mod((2*i0-1)*invert(3,p),p) && i3~=mod((-1+i2)*invert(2,p),p)           %Ri_Dm_I  Ri_Dm_J   把可能落到S1的值避免(i3当i1使)
%                                  S1(end+1)=mod(p-1-3*j,p);
%                               end
%                            else
%                               if ismember(mod(p-1-3*j,p),remove_4(U,S0,S2,S1))==1 && i3~=mod((i0-1)*invert(2,p),p) && i3~=mod((2*i0-1)*invert(3,p),p) && i3~=mod((-1+i2)*invert(2,p),p)           %Ri_Dm_I  Ri_Dm_J   把可能落到S1的值避免(i3当i1使)
%                                  S1(end+1)=mod(p-1-3*j,p);
%                               end 
%                            end 
%                         else
%                             if p<=11
%                               if ismember(mod(i3-3*j,p),remove_4(U,S0,S2,S1))==1 %&& i3~=mod((i0-1)*invert(2,p),p) && i3~=mod((2*i0-1)*invert(3,p),p)  && i3~=mod((-1+i2)*invert(2,p),p)
%                                  S1(end+1)=mod(i3-3*j,p);  
%                               end
%                            else  
%                               if ismember(mod(i3-3*j,p),remove_4(U,S0,S2,S1))==1 && i3~=mod((i0-1)*invert(2,p),p) && i3~=mod((2*i0-1)*invert(3,p),p)  && i3~=mod((-1+i2)*invert(2,p),p)
%                                  S1(end+1)=mod(i3-3*j,p);  
%                               end
%                            end
%                         end
%                   if length(S1)==floor((p-1)/4)
%                       break;
%                   end
%           end   
%           if length(S1)==floor((p-1)/4)
%                 break;
%           end      
%       end
%       if length(S1)<floor((p-1)/4)
%          S1(end+1)=min(remove_4(U,S0,S2,S1)); 
%       end
% end
% S3=remove_4(U,S0,S2,S1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%版本三   提前归公共部分H I J到S1 S2 S3
if j==0
   i2=0; 
else
   i2=mod(p-1-2*j,p);
end
i2_2=0;
H=(1);
for M=1:p
    if mod(2^M,p) < p
       H(end+1)=mod(2^M,p);
       if ismember(H(end),H(1:end-1))==1
           H(end)=[];
           break;
       end
    end
end
ord=length(H);

% S1(1)=mod(p-1-j,p);
% S2(1)=mod(p-1-2*j,p);
% S3(1)=mod(p-1-3*j,p);
% if(p>11 && j~=0)
%   S0(1)= mod(p-1-j,p); 
%   S0(2)= mod(p-1-2*j,p); 
%   S0(3)= mod(p-1-3*j,p); 
% end

%%%%%%%%%%%%%填满S2  (R0接受公共因子)
while length(S2)<ceil((p-1)/4)
    for k=0:(ord-1)                    %ord(2) 和p值的关
        if mod(((i2+1)*2^k-1),p)==mod(p-1-2*j,p) && length(S0)<floor((p-1)/4) 
           S0(end+1)=mod(p-1-2*j,p);
        else
           if (mod(((i2+1)*2^k-1),p)~=mod(p-1-j,p) && mod(((i2+1)*2^k-1),p)~=mod(p-1-3*j,p))
               S2(end+1)=mod(((i2+1)*2^k-1),p); 
           if length(S2)==ceil((p-1)/4)  
              if k<ord-1 && length(S0)<floor((p-1)/4) &&  ismember(mod((i2+1)*(2^k)*invert(2,p),p),remove(U,S0,S2))==1                                                     %ord(2) 和p值的关系
                 S0(end+1)=mod((i2+1)*(2^k)*invert(2,p),p); 
                 break;
              end
              break;
           end
           end
        end
    end
    i2=min(remove(U,S0,S2));
end
%%%%%%%%%%%%%%%%填满S0
while length(S0)<floor((p-1)/4)
      Q0=S0;
      if length(Q0)==0
         Q0(end+1)=min(remove_2(U,S2));
      end
      for i= 1:length(Q0)
          i0=Q0(i);
             for n = 1:length(S2)
                 i2=S2(n);
                 if i2~=mod(p-1-2*j,p)
                    i2=mod(i2+2*j,p);
                 else
                    i2=mod(2*j-1,p); 
                 end
                 i1=mod((i0+i2)*invert(2,p),p);    %Ri_Dm_En 把可能落到S1的值避免    
                      if i1==mod(j-1,p) 
                           if p<11
                              if ismember(mod(p-1-j,p),remove_5(U,S0,S1,S2,S3))==1 %&& i1~=mod(-2-i2,p) && i1~=mod(3*i2+2,p)          %Ri_En_H  Ri_En_J  把可能落到S0的值避免(i1当i0使)
                                 S0(end+1)=mod(p-1-j,p);
                              end
                           else
                              if ismember(mod(p-1-j,p),remove_5(U,S0,S1,S2,S3))==1 && i1~=mod(-2-i2,p) && i1~=mod(3*i2+2,p) && length(S0)<floor((p-1)/4)          %Ri_En_H  Ri_En_J  把可能落到S0的值避免(i1当i0使)
                                 S0(end+1)=mod(p-1-j,p);
                              end
                           end
                      else
                           if p<11
                              if ismember(mod(i1-j,p),remove_5(U,S0,S1,S2,S3))==1 %&& i1~=mod(-2-i2,p) && i1~=mod(3*i2+2,p)
                                 S0(end+1)=mod(i1-j,p);  
                              end
                           else
                              if ismember(mod(i1-j,p),remove_5(U,S0,S1,S2,S3))==1  && i1~=mod(-2-i2,p) && i1~=mod(3*i2+2,p)
                                 S0(end+1)=mod(i1-j,p);  
                              end
                           end
                        end
                  if length(S0)==floor((p-1)/4)
                          break;
                  end
             end
             if length(S0)==floor((p-1)/4)
                break;
             end  
      end
      if length(S0)==floor((p-1)/4)
         break;
      end
end
% %%%%%%%%%%%%%%%填满S1
if j~=0
    if ismember(mod(p-1-j,p),remove(U,S0,S2))==1
       S1(end+1)=mod(p-1-j,p);
    end
       S3(end+1)=mod(p-1-3*j,p);
end

S1
while length(S1)<floor((p-1)/4)
      for m = 1:length(S0)
          i0=S0(m);
          for n = 1:length(S2)
              i2=S2(n);
              i2
              if i2~=mod(p-1-2*j,p)
                 i2=mod(i2+2*j,p);
              else
                 i2=mod(2*j-1,p); 
              end
                 i3=mod((3*i2-i0)*invert(2,p),p);      %Ri_En_Fq 把可能落到S3的值避免
                       if i3==mod(3*j-1,p) 
                           if p<=11
                              if ismember(mod(p-1-3*j,p),remove_5(U,S0,S1,S2,S3))==1 %&& i3~=mod((i0-1)*invert(2,p),p) && i3~=mod((2*i0-1)*invert(3,p),p) && i3~=mod((-1+i2)*invert(2,p),p)           %Ri_Dm_I  Ri_Dm_J   把可能落到S1的值避免(i3当i1使)
                                 S1(end+1)=mod(p-1-3*j,p);
                              end
                           else
                              if ismember(mod(p-1-3*j,p),remove_5(U,S0,S1,S2,S3))==1 && i3~=mod((i0-1)*invert(2,p),p) && i3~=mod((2*i0-1)*invert(3,p),p) && i3~=mod((-1+i2)*invert(2,p),p)           %Ri_Dm_I  Ri_Dm_J   把可能落到S1的值避免(i3当i1使)
                                 S1(end+1)=mod(p-1-3*j,p);
                              end 
                           end 
                        else
                            if p<=11
                              if ismember(mod(i3-3*j,p),remove_5(U,S0,S1,S2,S3))==1 %&& i3~=mod((i0-1)*invert(2,p),p) && i3~=mod((2*i0-1)*invert(3,p),p)  && i3~=mod((-1+i2)*invert(2,p),p)
                                 S1(end+1)=mod(i3-3*j,p);  
                              end
                           else  
                              if ismember(mod(i3-3*j,p),remove_5(U,S0,S1,S2,S3))==1 && i3~=mod((i0-1)*invert(2,p),p) && i3~=mod((2*i0-1)*invert(3,p),p)  && i3~=mod((-1+i2)*invert(2,p),p)
                                 S1(end+1)=mod(i3-3*j,p);  
                                 %i3
                                 %mod(i3-3*j,p)
                              end
                           end
                        end
                  if length(S1)==floor((p-1)/4)
                      break;
                  end
          end   
          if length(S1)==floor((p-1)/4)
                break;
          end      
      end
      if length(S1)<floor((p-1)/4)
         S1(end+1)=min(remove_5(U,S0,S1,S2,S3)); 
      end
end
S1
S3=remove_4(U,S0,S1,S2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%版本四
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% if j==0
%    i2=0; 
% else
%    i2=mod(p-1-2*j,p);
% end
% i2_2=0;
% H=(1);
% for M=1:p
%     if mod(2^M,p) < p
%        H(end+1)=mod(2^M,p);
%        if ismember(H(end),H(1:end-1))==1
%            H(end)=[];
%            break;
%        end
%     end
% end
% ord=length(H);
% 
% % S1(1)=mod(p-1-j,p);
% % S2(1)=mod(p-1-2*j,p);
% % S3(1)=mod(p-1-3*j,p);
% 
% if(p>11 && j~=0)
%   S0(1)= mod(p-1-j,p); 
%   S0(2)= mod(p-1-2*j,p); 
%   S0(3)= mod(p-1-3*j,p); 
% end
% %%%%%%%%%%%%%填满S2  (R0接受公共因子)
% while length(S2)<ceil((p-1)/4)
%     for k=0:(ord-1)                    %ord(2) 和p值的关
%         if mod(((i2+1)*2^k-1),p)==mod(p-1-2*j,p)  && length(S0)<floor((p-1)/4) 
%            S0(end+1)=mod(((i2+1)*2^k-1),p);
%         else
%            if (mod(((i2+1)*2^k-1),p)~=mod(p-1-j,p) && mod(((i2+1)*2^k-1),p)~=mod(p-1-3*j,p))
%            S2(end+1)=mod(((i2+1)*2^k-1),p); 
%            if length(S2)==ceil((p-1)/4)  
%               if k<ord-1 && length(S0)<floor((p-1)/4)                                                         %ord(2) 和p值的关系
%                  S0(end+1)=mod((i2+1)*(2^k)*invert(2,p),p); 
%                  break;
%               end
%               break;
%            end
%            end
%         end
%     end
%     i2=min(remove(U,S0,S2));
% end
% %%%%%%%%%%%%%%%%填满S0
% while length(S0)<floor((p-1)/4)
%       Q0=S0;
%       if length(Q0)==0
%          Q0(end+1)=min(remove_2(U,S2));
%       end
%       for i= 1:length(Q0)
%           i0=Q0(i);
%              for n = 1:length(S2)
%                  i2=S2(n);
%                  if i2~=mod(p-1-2*j,p)
%                     i2=mod(i2+2*j,p);
%                  else
%                     i2=mod(2*j-1,p); 
%                  end
%                  i1=mod((i0+i2)*invert(2,p),p);    %Ri_Dm_En 把可能落到S1的值避免    
%                       if i1==mod(j-1,p) 
%                            if p<11
%                               if ismember(mod(p-1-j,p),remove_5(U,S0,S1,S2,S3))==1 %&& i1~=mod(-2-i2,p) && i1~=mod(3*i2+2,p)          %Ri_En_H  Ri_En_J  把可能落到S0的值避免(i1当i0使)
%                                  S0(end+1)=mod(p-1-j,p);
%                               end
%                            else
%                               if ismember(mod(p-1-j,p),remove_5(U,S0,S1,S2,S3))==1 && i1~=mod(-2-i2,p) && i1~=mod(3*i2+2,p) && length(S0)<floor((p-1)/4)          %Ri_En_H  Ri_En_J  把可能落到S0的值避免(i1当i0使)
%                                  S0(end+1)=mod(p-1-j,p);
%                               end
%                            end
%                       else
%                            if p<11
%                               if ismember(mod(i1-j,p),remove_5(U,S0,S1,S2,S3))==1 %&& i1~=mod(-2-i2,p) && i1~=mod(3*i2+2,p)
%                                  S0(end+1)=mod(i1-j,p);  
%                               end
%                            else
%                               if ismember(mod(i1-j,p),remove_5(U,S0,S1,S2,S3))==1  && i1~=mod(-2-i2,p) && i1~=mod(3*i2+2,p)
%                                  S0(end+1)=mod(i1-j,p);  
%                               end
%                            end
%                         end
%                   if length(S0)==floor((p-1)/4)
%                           break;
%                   end
%              end
%              if length(S0)==floor((p-1)/4)
%                 break;
%              end  
%       end
%       if length(S0)==floor((p-1)/4)
%          break;
%       end
% end
% % %%%%%%%%%%%%%%%填满S1
% while length(S1)<floor((p-1)/4)
%       for m = 1:length(S0)
%           i0=S0(m);
%           for n = 1:length(S2)
%               i2=S2(n);
%               if i2~=mod(p-1-2*j,p)
%                  i2=mod(i2+2*j,p);
%               else
%                  i2=mod(2*j-1,p); 
%               end
%                  i3=mod((3*i2-i0)*invert(2,p),p);                                                                          %Ri_En_Fq 把可能落到S3的值避免
%                      if i3==mod(3*j-1,p) 
%                            if p<=11
%                               if ismember(mod(p-1-3*j,p),remove_5(U,S0,S1,S2,S3))==1 %&& i3~=mod((i0-1)*invert(2,p),p) && i3~=mod((2*i0-1)*invert(3,p),p) && i3~=mod((-1+i2)*invert(2,p),p)           %Ri_Dm_I  Ri_Dm_J   把可能落到S1的值避免(i3当i1使)
%                                  S1(end+1)=mod(p-1-3*j,p);
%                               end
%                            else
%                               if ismember(mod(p-1-3*j,p),remove_5(U,S0,S1,S2,S3))==1 && i3~=mod((i0-1)*invert(2,p),p) && i3~=mod((2*i0-1)*invert(3,p),p) && i3~=mod((-1+i2)*invert(2,p),p)           %Ri_Dm_I  Ri_Dm_J   把可能落到S1的值避免(i3当i1使)
%                                  S1(end+1)=mod(p-1-3*j,p);
%                               end 
%                            end 
%                         else
%                             if p<=11
%                               if ismember(mod(i3-3*j,p),remove_5(U,S0,S1,S2,S3))==1 %&& i3~=mod((i0-1)*invert(2,p),p) && i3~=mod((2*i0-1)*invert(3,p),p)  && i3~=mod((-1+i2)*invert(2,p),p)
%                                  S1(end+1)=mod(i3-3*j,p);  
%                               end
%                            else  
%                               if ismember(mod(i3-3*j,p),remove_5(U,S0,S1,S2,S3))==1 && i3~=mod((i0-1)*invert(2,p),p) && i3~=mod((2*i0-1)*invert(3,p),p)  && i3~=mod((-1+i2)*invert(2,p),p)
%                                  S1(end+1)=mod(i3-3*j,p);  
%                               end
%                            end
%                         end
%                   if length(S1)==floor((p-1)/4)
%                       break;
%                   end
%           end   
%           if length(S1)==floor((p-1)/4)
%                 break;
%           end      
%       end
%       if length(S1)<floor((p-1)/4)
%          S1(end+1)=min(remove_5(U,S0,S1,S2,S3)); 
%       end
% end
% S3=remove_4(U,S0,S1,S2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

for n3=1:length(S3)
    if S3(n3)~=mod(p-1-3*j,p) 
        S3_1(n3)=mod(S3(n3)+3*j,p);
    else
        S3_1(n3)=mod(3*j-1,p);
    end
end

%%%%交点可能涉及失效列j的值——直接统计R_D、R_E、 R_F || D_E、 D_F、 E_F交点个数
%R_D
countR_D=0;                                              %Ri_D'一定有交点;Ri_H 不一定有交点;当S0(n0)取得H即是公共因子的数、位置，就不可下载此位置的数
for n0=1:length(S0)
    if mod(p-1-j,p)==S0(n0)
        countR_D=countR_D+1;
    end
end
countR_D=length(S0)*length(S1)+length(S0)-countR_D;

% R_E
countR_E=0;
for n0=1:length(S0)
    if mod(p-1-2*j,p)==S0(n0)
        countR_E=countR_E+1;
    end
end
countR_E=length(S0)*length(S2)+length(S0)-countR_E;

% R_F
countR_F=0;
for n0=1:length(S0)
    if mod(p-1-3*j,p)==S0(n0)
        countR_F=countR_F+1;
    end
end
countR_F=length(S0)*length(S2)+length(S0)-countR_F;

% D_E
%%检验Dm_En是否可能存在交点 %交点个数
count1=1;
D_E=[];
D_EM=[];              %%交点下标
for n1=1:length(S1)
    i1=S1(n1);
    if i1~=mod(p-1-j,p)
       i1=mod(i1+j,p);
    else
       i1=mod(j-1,p); 
    end
    for n2=1:length(S2)
        i2=S2(n2);
          if i2~=mod(p-1-2*j,p)
             i2=mod(i2+2*j,p);
          else
             i2=mod(2*j-1,p); 
          end    
        if mod((2*i1-i2),p)~=p-1
            D_E(count1,:)=[S1(n1) S2(n2)];
            if(mod(i2-i1,p)~=j)
               D_EM(count1,:)=[mod((2*i1-i2),p) mod(i2-i1,p)];
               count1=count1+1;
            end
        end
    end
end

%%交点可能涉及失效列j的值
countD_E=0;
for n1=1:length(S1)                       %% D'm_I  
    if S1(n1)~=mod(p-1-j,p)
       if mod(p-1-2*j,p)==S1(n1)
          countD_E=countD_E+1;
       end
    end
end
for n2=1:length(S2)                        %%E'n_H
    if S2(n1)~=mod(p-1-2*j,p)
       if mod(p-1-j,p)==S2(n2)
          countD_E=countD_E+1;
       end
    end
end
countD_E=(count1-1)+length(S1)+length(S2)-countD_E; 

% D_F
%%检验Dm_Fq是否可能存在交点 %交点个数
count2=1;
D_F=[];               %%交点m n集合选择
D_FM=[];              %%交点下标
for n1=1:length(S1)
    i1=S1(n1);
    if i1~=mod(p-1-j,p)
       i1=mod(i1+j,p);
    else
       i1=mod(j-1,p); 
    end
    for n3=1:length(S3)
         i3=S3(n3);
         if i3~=mod(p-1-3*j,p)
            i3=mod(i3+3*j,p);
         else
            i3=mod(3*j-1,p); 
         end
        if mod((3*i1-i3)*invert(2,p),p)~=p-1
            D_F(count2,:)=[S1(n1),S3(n3)];
            if(mod((i3-i1)*invert(2,p),p)~=j)
               D_FM(count2,:)=[mod((3*i1-i3)*invert(2,p),p) mod((i3-i1)*invert(2,p),p)];
               count2=count2+1;
            end
        end
    end
end

%%交点可能涉及失效列j的值
countD_F=0;                             
for n3=1:length(S3)                    %% F'q_H
    if S3(n3)~=mod(p-1-3*j,p)
       if mod(p-1-j,p)==S3(n3)
          countD_F=countD_F+1;
       end
    end
end
for n1=1:length(S1)                    %% D'm_J 
    if S1(n1)~=mod(p-1-j,p)
       if mod(p-1-3*j,p)==S1(n1)
         countD_F=countD_F+1;
       end
    end
end
countD_F=(count2-1)+length(S1)+length(S3)-countD_F;

% E_F
%%检验En_Fq是否可能存在交点 %交点个数
count3=1;
E_F=[];               %%交点m n集合选择
E_FM=[];              %%交点下标
for n2=1:length(S2)
    i2=S2(n2);
    if i2~=mod(p-1-2*j,p)
       i2=mod(i2+2*j,p);
    else
       i2=mod(2*j-1,p); 
    end 
    for n3=1:length(S3)
        i3=S3(n3);
        if i3~=mod(p-1-3*j,p)
           i3=mod(i3+3*j,p);
        else
           i3=mod(3*j-1,p); 
        end
        if mod((3*i2-2*i3),p)~=p-1
            E_F(count3,:)=[S2(n2),S3(n3)];
            if(mod(i3-i2,p)~=j)
               E_FM(count3,:)=[mod((3*i2-2*i3),p) mod(i3-i2,p)];
               count3=count3+1;
            end
        end
    end
end

%%交点可能涉及失效列j的值
countE_F=0;                            
for n3=1:length(S3)
   if S3(n1)~=mod(p-1-3*j,p)
     if mod(p-1-2*j,p)==S3(n3)          %% F'q_I
        countE_F=countE_F+1;
     end
   end
end
for n2=1:length(S2)                     %% E'n_J 
    if S2(n2)~=mod(p-1-2*j,p)
      if mod(p-1-3*j,p)==S2(n2)
        countE_F=countE_F+1;
      end
    end
end
countE_F=(count3-1)+length(S2)+length(S3)-countE_F;

%%%%%%%%%%%%%%%%R_D_E
% R_Dm'_E'
R_D_E=[];
R_D_EM=[]; 
count4=1;
for n0=1:length(S0)
    if count1>1
    for Mark=1:count1-1
          if D_EM(Mark,1)==S0(n0)
             R_D_E(count4,:)=[S0(n0) D_E(Mark,1) D_E(Mark,2)];
             if(D_EM(Mark,2)~=j)
                R_D_EM(count4,:)=[S0(n0) D_EM(Mark,2)];
                count4=count4+1;
             end
          end  
    end
    end
end

% R_Dm'_I
R_D_I=[];
R_D_IM=[]; 
count5=1;
for n1=1:length(S1) 
    i1=S1(n1);
    if i1~=mod(p-1-j,p)
       i1=mod(i1+j,p);
    else
       i1=mod(j-1,p); 
    end
    if S1(n1)~=mod(p-1-2*j,p)
       for n0=1:length(S0)
           i0=S1(n0);
           if i0==mod(2*i1+1,p)
              R_D_I(count5,:)=[S0(n0) S1(n1)];
              if mod(-i1-1,p)~=j
                 R_D_IM(count5,:)=[mod(2*i1+1,p) mod(-i1-1,p)];
                 count5=count5+1;
              end
           end
       end
    end
end

% R_En'_H
R_E_H=[];
R_E_HM=[]; 
count6=1;
for n2=1:length(S2)
    i2=S2(n2);
    if i2~=mod(p-1-2*j,p)
       i2=mod(i2+2*j,p);
    else
       i2=mod(2*j-1,p); 
    end 
    if S2(n2)~=mod(p-1-j,p)
       for n0=1:length(S0)
           i0=S0(n0);
           if i0==mod(-2-i2,p)
              R_E_H(count6,:)=[S0(n0) S2(n2)];
              if mod(i2+1,p)~=j
                R_E_HM(count6,:)=[i0 mod(i2+1,p)];
                count6=count6+1;
              else
                 R_E_H=[];
              end
           end
       end
    end
end
%%%%%%%%%%%%%%%%% R_D_E=Ri_Dm'_En'+ Ri_Dm_I + R_En'_H
countR_D_E=(count4-1)+(count5-1)+(count6-1);


%%%%%%%%%%%%%%%%R_D_F
% Ri_Dm'_Fq'
R_D_F=[];
R_D_FM=[]; 
count7=1;
for n0=1:length(S0)
    if count2>1
    for Mark=1:count2-1
          if D_FM(Mark,1)==S0(n0)
             R_D_F(count7,:)=[S0(n0) D_F(Mark,1) D_F(Mark,2)];
             if(D_FM(Mark,2)~=j)
                R_D_FM(count7,:)=[S0(n0) D_FM(Mark,2)];
                count7=count7+1;
             end
          end  
    end
    end
end

% R_Dm'_J
R_D_J=[];
R_D_JM=[]; 
count8=1;
for n1=1:length(S1)
    i1=S1(n1);
    if i1~=mod(p-1-j,p)
       i1=mod(i1+j,p);
    else
       i1=mod(j-1,p); 
    end
    if S1(n1)~=mod(p-1-3*j,p)
       for n0=1:length(S0)
           i0=S0(n0);
           if i0==mod((3*i1+1)*invert(2,p),p)
              R_D_J(count8,:)=[S0(n0) S1(n1)];
              if mod((-i1-1)*invert(2,p),p)~=j
                 R_D_JM(count8,:)=[S0(n0) mod((-i1-1)*invert(2,p),p)];
                 count8=count8+1;
              end
           end
       end
    end
end

% R_Fq'_H
R_F_H=[];
R_F_HM=[]; 
count9=1;
for n3=1:length(S3)
    i3=S3(n3);
    if i3~=mod(p-1-3*j,p)
       i3=mod(i3+3*j,p);
    else
       i3=mod(3*j-1,p); 
    end
    if S3(n3)~=mod(p-1-j,p)
       for n0=1:length(S0)
           i0=S0(n0);
           if i0==mod((-3-i3)*invert(2,p),p)
              R_F_H(count9,:)=[S0(n0) S3(n3)];
              if mod((i3+1)*invert(2,p),p)~=j
                R_F_HM(count9,:)=[S0(n0) mod((i3+1)*invert(2,p),p)];
                count9=count9+1;
              end
           end
       end
    end
end
%%%%%%%%%%%%%%%%% R_D_F=Ri_Dm'_Fq'+ Ri_Dm_J + R_Fq'_I
countR_D_F=(count7-1)+(count8-1)+(count9-1);


%%%%%%%%%%%%%%%%R_E_F
% Ri_En'_Fq'
R_E_F=[];
R_E_FM=[]; 
count10=1;
for n0=1:length(S0)
    if count3>1
    for Mark=1:count3-1
          if E_FM(Mark,1)==S0(n0)
             R_E_F(count10,:)=[S0(n0) E_F(Mark,1) E_F(Mark,2)];
             if(E_FM(Mark,2)~=j)
                R_E_FM(count10,:)=[S0(n0) E_FM(Mark,2)];
                count10=count10+1;
             end
          end  
    end
    end
end

% R_En'_J
R_E_J=[];
R_E_JM=[]; 
count11=1;
for n2=1:length(S2)
    i2=S2(n2);
    if i2~=mod(p-1-2*j,p)
       i2=mod(i2+2*j,p);
    else
       i2=mod(2*j-1,p); 
    end 
    if S2(n2)~=mod(p-1-3*j,p)
       for n0=1:length(S0)
           i0=S0(n0);
           if i0==mod((3*i2+2),p)
              R_E_J(count11,:)=[S0(n0) S2(n2)];
              if mod(-i2-1,p)~=j
                 R_E_JM(count11,:)=[S0(n0)  mod(-i2-1,p)];
                 count11=count11+1;
              end
           end
       end
    end
end

% R_Fq'_I
R_F_I=[];
R_F_IM=[]; 
count12=1;
for n3=1:length(S3)
    i3=S3(n3);
    if i3~=mod(p-1-3*j,p)
       i3=mod(i3+3*j,p);
    else
       i3=mod(3*j-1,p); 
    end
    if S3(n3)~=mod(p-1-2*j,p)
       for n0=1:length(S0)
           i0=S0(n0);
           if i0==mod(-2*i3-3,p)
              R_F_I(count12,:)=[S0(n0) S3(n3)];
              if mod((i3+1),p)~=j
                R_F_IM(count12,:)=[S0(n0) mod((i3+1),p)];
                count12=count12+1;
              end
           end
       end
    end
end
%%%%%%%%%%%%%%%%% R_D_F=Ri_Dm'_Fq'+ Ri_Dm_J + R_Fq'_I
countR_E_F=(count10-1)+(count11-1)+(count12-1);

%%%%%%%%%%%%%%%%D_E_F
% Dm_En'_Fq'
D_E_F=[];
D_E_FM=[]; 
count13=1;
for n3=1:length(S3)
    i3=S3(n3);
    if i3~=mod(p-1-3*j,p)
       i3=mod(i3+3*j,p);
    else
       i3=mod(3*j-1,p); 
    end
    if count1>1
    for Mark=1:count1-1
          if mod(i3-3*D_EM(Mark,2),p)==D_EM(Mark,1)
             D_E_F(count13,:)=[D_E(Mark,1) D_E(Mark,2) S3(n3)];
             if(D_EM(Mark,2)~=j)
                D_E_FM(count13,:)=[D_EM(Mark,1) D_EM(Mark,2)];
                count13=count13+1;
             end
          end  
    end
    end
end

% Dm_En'_J
D_E_J=[];
D_E_JM=[]; 
count14=1;
if count1>1
   for Mark=1:count1-1
       if mod(p-1-3*D_EM(Mark,2),p)==D_EM(Mark,1)
             D_E_J(count14,:)=[D_E(Mark,1) D_E(Mark,2)];
             if(D_EM(Mark,2)~=j)
                 D_E_JM(count14,:)=[D_EM(Mark,1) D_EM(Mark,2)];
                 count14=count14+1;
             end
          end  
   end
end

% Dm'_Fq'_I
D_F_I=[];
D_F_IM=[]; 
count15=1;
if count2>1
    for Mark=1:count2-1
          if mod(p-1-2*D_FM(Mark,2),p)==D_FM(Mark,1)
             D_F_I(count15,:)=[D_F(Mark,1) D_F(Mark,2)];
             if(D_FM(Mark,2)~=j)
                D_F_IM(count15,:)=[D_FM(Mark,1) D_FM(Mark,2)];
                count15=count15+1;
             end
          end  
    end
end

% En'_Fq'_H
E_F_H=[];
E_F_HM=[]; 
count16=1;
if count3>1
   for Mark=1:count3-1
          if mod(p-1-E_FM(Mark,2),p)==E_FM(Mark,1)
            E_F_H(count16,:)=[E_F(Mark,1) E_F(Mark,2)];
             if(E_FM(Mark,2)~=j)
               E_F_HM(count16,:)=[E_FM(Mark,1) E_FM(Mark,2)];
               count16=count16+1;
             end
          end  
    end
end

%%%%%%%%%%%%%%%%% Dm_En_Fq=Dm'_Fq'_En' + Dm'_Eq'_J + Dm'_Fq'_I + En'_Fq'_H
countD_E_F=(count13-1)+(count14-1)+(count15-1)+(count16-1);

%%%%%%%%%%%%%%%%% Ri_Dm_En_Fq
% Ri_Dm'_En'_Fq'
R_D_E_F=[];
R_D_E_FM=[]; 
count17=1;
for n0=1:length(S0)
    if count13>1;
    for Mark=1:count13-1
          if D_E_FM(Mark,1)==S0(n0)
             R_D_E_F(count17,:)=[S0(n0) D_E_F(Mark,1) D_E_F(Mark,2)];
             if(D_E_FM(Mark,2)~=j)
                R_D_E_FM(count17,:)=[S0(n0) D_E_FM(Mark,2)];
                count17=count17+1;
             end
          end  
    end
    end
end

% Ri_Dm'_En'_J
R_D_E_J=[];
R_D_E_JM=[]; 
count18=1;
for n0=1:length(S0)
    if count14>1
    for Mark=1:count14-1
          if D_E_JM(Mark,1)==S0(n0)
             R_D_E_J(count18,:)=[S0(n0) D_E_J(Mark,1) D_E_J(Mark,2)];
             if(D_E_JM(Mark,2)~=j)
                R_D_E_JM(count18,:)=[S0(n0) D_E_JM(Mark,2)];
                count18=count18+1;
             end
          end  
    end
    end
end

% Ri_Dm'_Fq'_I
R_D_F_I=[];
R_D_F_IM=[]; 
count19=1;
for n0=1:length(S0)
    if count15>1
    for Mark=1:count15-1
          if D_F_IM(Mark,1)==S0(n0)
             R_D_F_I(count18,:)=[S0(n0) D_F_I(Mark,1) D_F_I(Mark,2)];
             if(D_F_IM(Mark,2)~=j)
                R_D_F_IM(count18,:)=[S0(n0) D_F_IM(Mark,2)];
                count18=count18+1;
             end
          end  
    end
    end
end

% Ri_En'_Fq'_H
R_E_F_H=[];
R_E_F_HM=[];
count20=1;
for n0=1:length(S0)
    if count16>1
    for Mark=1:count16-1
          if E_F_HM(Mark,1)==S0(n0)
             R_E_F_H(count20,:)=[S0(n0) E_F_H(Mark,1) E_F_H(Mark,2)];
             if(E_F_HM(Mark,2)~=j)
                R_E_F_HM(count20,:)=[S0(n0) E_F_HM(Mark,2)];
                count20=count20+1;
             end
          end  
    end
    end
end
%%%%%%%%%%%%%%%%% Ri_Dm_En_Fq=Ri_Dm'_Fq'_En' + Ri_Dm'_Eq'_J + Ri_Dm'_Fq'_I + Ri_En'_Fq'_H
countR_D_E_F=(count17-1)+(count18-1)+(count19-1)+(count20-1);


%%%%%%%%%%%%%%%%%(evenodd(p,4))实际下载块____修复下限____evenodd(p,2)修复下限__evenodd(p,3)修复下限
%evenodd(p,4)修复下限

for n1=1:length(S1)
    if  S1(n1)==mod(p-1-j,p)
        L1=(length(S1)-1)*(p-1)+p;
        break;
    else
        L1=length(S1)*(p-1);
    end
end

for n2=1:length(S2)
    if  S2(n2)==mod(p-1-2*j,p)
        L2=(length(S2)-1)*(p-1)+p;
        break;
    else
        L2=length(S2)*(p-1);
    end
end

for n3=1:length(S3)
    if  S3(n3)==mod(p-1-3*j,p)
        L3=(length(S3)-1)*(p-1)+p;
        break;
    else
        L3=length(S3)*(p-1);
    end
end
%L3=length(S3)*(p-1);

if mod((p-1),4)==0
    if(j==0)
    limit_4=ceil((5*(p^2)-2*p-3)/8);
    download=length(S0)*p+L1+(p-1)+L2+(p-1)+L3+(p-1)-countR_D-countR_E-countR_F-countD_E-countD_F-countE_F+countR_D_E+countR_D_F+countR_E_F+countD_E_F-countR_D_E_F;
    else
    limit_4=ceil((5*(p^2)-2*p-3)/8-3);
     download=length(S0)*p+L1+(p-2)+L2+(p-2)+L3+(p-2)-countR_D-countR_E-countR_F-countD_E-countD_F-countE_F+countR_D_E+countR_D_F+countR_E_F+countD_E_F-countR_D_E_F;
    end
else
    if(j==0)
     limit_4=ceil((5*(p^2)-2*p+1)/8);
     download=length(S0)*p+L1+(p-1)+L2+(p-1)+L3+(p-1)-countR_D-countR_E-countR_F-countD_E-countD_F-countE_F+countR_D_E+countR_D_F+countR_E_F+countD_E_F-countR_D_E_F;
    else
     limit_4=ceil((5*(p^2)-2*p+1)/8-3);
     download=length(S0)*p+L1+(p-2)+L2+(p-2)+L3+(p-2)-countR_D-countR_E-countR_F-countD_E-countD_F-countE_F+countR_D_E+countR_D_F+countR_E_F+countD_E_F-countR_D_E_F;
    end
end
%evenodd(p,2)修复下限
limit_2=(3*(p^2)-2*p-1)/4;

newcount=0;
for i=0:p-2
    for j=0:p-1
        if mod(i+j,p)~=p-1 && mod(i+2*j,p)~=p-1 && mod(i+3*j,p)~=p-1 && ismember(mod(i+3*j,p),S3_1)==0 && ismember(mod(i+2*j,p),S2_1)==0 && ismember(mod(i+j,p),S1_1)==0 && ismember(i,S0)==0
           newcount=newcount+1;
        end
    end
end
%download_new=(p-1)*p-newcount;
download_4=(p-1)*p-newcount;