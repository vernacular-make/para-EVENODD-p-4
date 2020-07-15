clc;
clear;
% % %%%%%%%%%%%去除集合里最大的
% A=[0 2 3 4 5 6]; %%% 定义A矩阵。
% B=[1 3];
% c=[1 4];
% MAX=max(A);
% % A(:,2)=[];
% % A(:,MAX)=[];
% A(:,B)=[];

% %两个数组相同的元素
% a=[1,2,3,4,5,6]
% b=[2,3,5,8,10]
% intersect(a,b)

% %移除一数组中与另一数组相同的元素
% A = [1,2,3,4,6,8];
% B = [1,3,5,6];
% index = false(size(A));
% for i = 1:length(B)
% res = (A == B(i));
% index = (index | res);
% end
% C = A(~index);
% D=[];
% D(end+1)=1;
% D(end+1)=2;


% %%%%%%%%%%%满足条件的写入集合
% k=1;
% A=[70,60,50,80];
% for i=1:length(A);%A为分数集合
% if(A(i)>=60&&A(i)<=70)
% B(k)=A(i);
% k=k+1;
% end
% end;%B即为满足要求的新集合
% 
% 向下取整
% a=7.8;b=floor(a);
% 向上取整
% b=7.8;b=ceil(b);

% %<span style="font-size:18px;">%判断某数组中是否包含某元素
% clear,clc;
% a=[1,2,3,4,5]
% ismember(-1,a)
% ismember(5,a)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%初识化开始
p=input('请输入一素数p：');
j=input('请输入系统擦除列j：');%擦除列的范围在[0,p-1];
%ord=input('请输入系统擦除列ord：')
S0=[];S1=[];S2=[];S3=[]; %定义空的数组
%length(S0); 
for i=0:p-2
    U(i+1)=i;
end

if j==0
   i1=0;
   i2=0;
else
   i1=mod(p-1-2*j,p);
   i2=mod(p-1-3*j,p);
end

for M=1:p
    if(mod(2^0-1,p)==mod(2^M-1,p))
        ord=M;
        break;
    end
end
 
% for N=1:p
%     if(mod(3^0-1,p))==mod(3^N-1,p)
%         ord1=N;
%         break;
%     end
% end
H1=[1];
for N=1:p
    if mod(3^N,p) < p
       H1(end+1)=mod(3^N,p);
       if ismember(H1(end),H1(1:end-1))==1
           H1(end)=[];
           break;
       end
    end
end
ord1=length(H1);

%ord
%ord1
% c=0;
% %%%%%%%%%%%%%版本一：
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
% S0
% S1
% Q1=S0; %开辟新的空间存储Q1
% Q1
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
% 
% S0
% S1
% S2
% 
% Q0=S0;    %为S0开辟新的空间存储Q0 (复制)
% Q0
% S0
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
% disp('*****************');
% disp('分配修复位需要的奇偶校验集合号:S0 S1 S2 S3');
% disp(S0);
% disp(S1);
% disp(S2);
% disp(S3);
% %%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%分集合版本二：
% while length(S1)<floor((p-1)/4)
%     for k=0:(ord-1)                                                                 %ord(2) 和p值的关系
%         if mod(((i1+1)*(2^k)-1),p)==mod((p-1-j),p) 
%            S0(end+1)=mod(((i1+1)*2^k-1),p);
% %            if ismember(S0(end),S0(1:end-1))==1                                      
% %               S0(end)=[];
% %            end
%         else 
%           S1(end+1)=mod(((i1+1)*2^k-1),p);                                          %m~=<p-1-j>  +<p-1-2*j>
% %           if length(S1)<floor((p-1)/4)
% %               if ismember(S1(end),S1(1:end-1))==1 
% %                  S1(end)=[];
% %               end
% %           end
%           if length(S1)==floor((p-1)/4)  
%              if k<ord-1                                                             %ord(2) 和p值的关系
%                 S0(end+1)=(mod(((i1+1)*(2^(k+1))-1),p));                            %S1放不下 k没结束，将与可能落在S2中一些关联数——<2m-n>=p-1,放入S0
%                 break;
%              end
%           end
%         end
%     end
%      i1=min(remove(U,S0,S1));
% end
% S0
% S1
% Q1=S0; %开辟新的空间存储Q1
% Q1
% while length(S2)<ceil((p-1)/4)
%      if length(Q1)==0
%         Q1(end+1)=min(remove(U,S0,S1));
%      end
%      for k=0:(ord1-1)                                                              %ord1(3) 和p值的关系
%            if k==0
%              S2(end+1)=mod(((i2+1)*(3^k)-1),p);                                                                        %%m~=<p-1-j>  +<p-1-3*j>
%              if ismember(S2(end),S2(1:end-1))==1 || ismember(S2(end),S0(1:end))==1 || ismember(S2(end),S1(1:end))==1
%                 S2(end)=[];
%              end
%            end
%            for m = 1:length(Q1)
%                i0=Q1(m);
%               for n = 1:length(S1)
%                   i1=S1(n);
%                   if  mod(((i2+1)*(3^k)-1),p)~=mod(2*(i1+j)-i0-2*j,p) && mod(((i2+1)*(3^k)-1),p)~=mod(-2-i0-2*j,p) && mod(((i2+1)*(3^k)-1),p)~=mod((i0-2)*invert(3,p)-2*j,p) && length(S2)<ceil((p-1)/4)           %Ri_Dm_En // Ri_En_H
%                       S2(end+1)=mod(((i2+1)*(3^k)-1),p);
%                       if ismember(S2(end),S2(1:end-1))==1 || ismember(S2(end),S0(1:end))==1 || ismember(S2(end),S1(1:end))==1
%                          S2(end)=[];
%                       end
%                   end
%               end
%            end
%          if length(S2)==ceil((p-1)/4) && length(S0)< floor((p-1)/4)
%             if k<ord1-1     
%                S0(end+1)=mod(((i2+1)*(3^(k+1))-2)*invert(2,p),p);                                                           %En_Fq \ %S2放不下 k没结束，将与可能落在S3中一些关联数——<3n-2q>=p-1,放入S0
%               if ismember(S0(end),S0(1:end-1))==1 || ismember(S0(end),S2(1:end))==1 || ismember(S0(end),S1(1:end))==1
%                  S0(end)=[];
%               end
%               break;
%             end
%          end
%     end
%     i2=min(remove_4(U,S0,S1,S2));
% end
% 
% S0
% S1
% S2
% 
% Q0=S0;    %为S0开辟新的空间存储Q0 (复制)
% Q0
% S0
%  while  length(S0)<floor((p-1)/4)
%      if length(Q0)==0
%         Q0(end+1)=min(remove_4(U,S0,S1,S2));
%      end
%      for m = 1:length(Q0)
%          i1=Q0(m);
%          for n = 1:length(S2)
%              i2=S2(n);
%              for j1=0:p-1
%                  if mod(i1+j-j1,p)==mod(i2+2*j-2*j1,p)                                       %Dm_En_Fq  避免落在S3的值 取出来放入S0 
%                      i3=mod(i2-j+j1,p);
%                      if ismember(i3,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/4)
%                         S0(end+1)=i3;
%                         if ismember(S0(end),S0(1:end-1))==1 
%                             S0(end)=[];
%                         end
%                     end
%                  end
%              end
%          end
%      end
%      if length(S0)<floor((p-1)/4)
%         Q0=S0;
%         for m = 1:length(Q0)
%             i1=Q0(m);
%             for n = 1:length(S2)
%                 i2=S2(n);
%               for j1=0:p-1
%                  if mod(i2+2*j-2*j1,p)==mod(p-1-j1,p)                                       %En_Fq_H   避免落在S3的值 取出来放入S0 
%                     i3=mod(-1+2*j1-3*j,p);
%                     if ismember(i3,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/4)
%                        S0(end+1)=i3;
%                        if ismember(S0(end),S0(1:end-1))==1 
%                           S0(end)=[];
%                        end
%                     end
%                  end
%               end
%             end
%         end
%      end  
%      if length(S0)<floor((p-1)/4)
%         Q0=S0;
%         for m = 1:length(Q0)
%             i1=Q0(m);
%                 for j1=0:p-1
%                     if mod(i1+j-j1,p)==mod(p-1-2*j1,p)  
%                         i3=mod(-1+j1-3*j,p);                                                          %Dm_Fq_I   避免落在S3的值 取出来放入S0 
%                         if ismember(i3,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/4)
%                            S0(end+1)=i3;
%                            if ismember(S0(end),S0(1:end-1))==1 
%                                S0(end)=[];
%                            end
%                         end
%                      end     
%                 end  
%         end
%      end
%      if length(S0)==floor((p-1)/4)
%         break;
%      end
%  end
% S3=remove_4(U,S0,S1,S2);
% disp('*****************');
% disp('分配修复位需要的奇偶校验集合号:S0 S1 S2 S3');
% disp(S0);
% disp(S1);
% disp(S2);
% disp(S3);

% %%%%%%%%%%%%%%%分集合版本三：
% p=input('请输入一素数p：');
% j=input('请输入系统擦除列j：');%擦除列的范围在[0,p-1];
% %ord=input('请输入系统擦除列ord：')
% S0=[];S1=[];S2=[];S3=[]; %定义空的数组
% %length(S0); 
% for i=0:p-2
%     U(i+1)=i;                 %划分行选择U [0,p-2];d0,j\d1,j\...\dp-2,j分别被修复
% end
% 
% i1=0;
% i2_2=0;
% 
% for M=1:p
%     if(mod(2^0-1,p)==mod(2^M-1,p))
%         ord=M;
%         break;
%     end
% end
% 
% for N=1:p
%     if(mod(3^0-1,p))==mod(3^N-1,p)
%         ord1=N;
%         break;
%     end
% end
% while length(S1)<floor((p-1)/4)
%     for k=0:(ord-1)                                                                 %ord(2) 和p值的关系
%         S1(end+1)=mod(((i1+1)*2^k-1),p);
%         if ismember(S1(end),S1(1:end-1))==1 
%              S1(end)=[];
%         end
%         if length(S1)==floor((p-1)/4)  
%            if k<ord-1                                                             %ord(2) 和p值的关系
%               S0(end+1)=(mod(((i1+1)*(2^(k+1))-1),p));                            %S1放不下 k没结束，将与可能落在S2中一些关联数——<2m-n>=p-1,放入S0
%               break;
%            end
%         end
%     end
%     i1=min(remove(U,S0,S1));
% end
% 
% S0
% S1
% Q1=S0; %开辟新的空间存储Q1
% Q1
% while length(S2)<ceil((p-1)/4)
%      if length(Q1)==0
%         Q1(end+1)=min(remove(U,S0,S1));
%      end
%      for k=0:(ord1-1)                        %ord1(3) 和p值的关系 
%          i2=mod(((i2_2+1)*(3^k)-1),p)+2*j;
%          if i2==mod(p-1-2*j,p)
%             i2=2*j-1;
%          end   
%          for m = 1:length(Q1)
%              i0=Q1(m);
%              for n = 1:length(S1)
%                  if i1~=mod(p-1-j,p)
%                     i1=S1(n)+j;
%                  else
%                     i1=j-1; 
%                  end
%                  if  i2~=mod(2*(i1)-i0,p) && i2~=mod(-2-i0,p) && i2~=mod((i0-2)*invert(3,p),p) && length(S2)<ceil((p-1)/4)            %Ri_Dm_En // Ri_En_H // Ri_En_J
%                      if i2==2*j-1;
%                         S2(end+1)=mod(p-1-2*j,p);
%                      else
%                         S2(end+1)=i2-2*j;  
%                      end
%                      if ismember(S2(end),remove(U,S0,S1))==0 || ismember(S2(end),S2(1:end-1))==1 
%                         S2(end)=[];
%                      end
%                  end
%                  if length(S2)==ceil((p-1)/4)
%                     break;
%                  end
%            end
%         end   
%     end
%     i2_2=min(remove_4(U,S0,S1,S2));
% end
% 
% S0
% S1
% S2
% 
% Q0=S0;    %为S0开辟新的空间存储Q0 (复制)
% Q0
% S0
%  while  length(S0)<floor((p-1)/4)
%      if length(Q0)==0
%         Q0(end+1)=min(remove_4(U,S0,S1,S2));
%      end
%      for m = 1:length(Q0)
%          i1=Q0(m);
%          for n = 1:length(S2)
%              i2=S2(n);
%              for j1=0:p-1
%                  if mod(i1+j-j1,p)==mod(i2+2*j-2*j1,p)                                      %Dm_En_Fq  避免落在S3的值 取出来放入S0 
%                      i3=mod(i2-j+j1,p);
%                      if ismember(i3,remove_4(U,S0,S1,S2))==1 % && length(S0)<floor((p-1)/4)
%                         S0(end+1)=i3;
%                         if ismember(S0(end),S0(1:end-1))==1 
%                             S0(end)=[];
%                         end
%                      end
%                  end
%                  
%                  if length(S0)==floor((p-1)/4)
%                     break;
%                  end
%                  
%              end
%          end
%      end
%      if length(S0)<floor((p-1)/4)
%         Q0=S0;
%         for m = 1:length(Q0)
%             i1=Q0(m);
%             for n = 1:length(S2)
%                 i2=S2(n);
%               for j1=0:p-1
%                  if mod(i2+2*j-2*j1,p)==mod(p-1-j1,p)                                       %En_Fq_H   避免落在S3的值 取出来放入S0 
%                     i3=mod(-1+2*j1-3*j,p);
%                     if ismember(i3,remove_4(U,S0,S1,S2))==1 % && length(S0)<floor((p-1)/4)
%                        S0(end+1)=i3;
%                        if ismember(S0(end),S0(1:end-1))==1 
%                           S0(end)=[];
%                        end
%                     end
%                  end
%                  
%                  if length(S0)==floor((p-1)/4)
%                     break;
%                  end
%                  
%               end
%             end
%         end
%      end  
%      if length(S0)<floor((p-1)/4)
%         Q0=S0;
%         for m = 1:length(Q0)
%             i1=Q0(m);
%                 for j1=0:p-1
%                     if mod(i1+j-j1,p)==mod(p-1-2*j1,p)  
%                         i3=mod(-1+j1-3*j,p);                                                          %Dm_Fq_I   避免落在S3的值 取出来放入S0 
%                         if ismember(i3,remove_4(U,S0,S1,S2))==1 %&& length(S0)<floor((p-1)/4)
%                            S0(end+1)=i3;
%                            if ismember(S0(end),S0(1:end-1))==1 
%                                S0(end)=[];
%                            end
%                         end
%                     end 
%                     
%                     if length(S0)==floor((p-1)/4)
%                       break;
%                     end
%                     
%                 end  
%         end
%      end  
%  end
% S3=remove_4(U,S0,S1,S2);
% disp('*****************');
% disp('分配修复位需要的奇偶校验集合号:S0 S1 S2 S3');
% disp(S0);
% disp(S1);
% disp(S2);
% disp(S3);

% %%%%%%%%%%%%%%%分集合版本四：
% p=input('请输入一素数p：');
% j=input('请输入系统擦除列j：');%擦除列的范围在[0,p-1];
% %ord=input('请输入系统擦除列ord：')
% S0=[];S1=[];S2=[];S3=[]; %定义空的数组
% %length(S0); 
% for i=0:p-2
%     U(i+1)=i;                 %划分行选择U [0,p-2];d0,j\d1,j\...\dp-2,j分别被修复
% end
% 
% i1=1;
% i2_2=0;
% 
% for M=1:p
%     if(mod(2^0-1,p)==mod(2^M-1,p))
%         ord=M;
%         break;
%     end
% end
% for N=1:p
%     if(mod(3^0-1,p))==mod(3^N-1,p)
%         ord1=N;
%         break;
%     end
% end
% %%%%%%%%%%%%%填满S1
% while length(S1)<floor((p-1)/4)
%     for k=0:(ord-1)                                                                 %ord(2) 和p值的关系
%         S1(end+1)=mod((i1*2^k-1),p);
%         if ismember(S1(end),S1(1:end-1))==1 
%            S1(end)=[];
%         end
%         if length(S1)==floor((p-1)/4)  
%            if k<ord-1                                                             %ord(2) 和p值的关系
%               S0(end+1)=(mod((i1*(2^(k+1))-1),p));                                %S1放不下 k没结束，将与可能落在S2中一些关联数——<2m-n>=p-1,放入S3
%               break;
%            end
%         end
%     end
%     i1=min(remove(U,S0,S1));
% end
% S0
% %%%%%%%%%%%%%%%%填满S0
% while length(S0)<floor((p-1)/4)
%       Q1=S0;
%       if length(Q1)==0
%         Q1(end+1)=min(remove(U,S3,S1));
%       end
%       for m = 1:length(Q1)
%              i0=Q1(m);
%              for n = 1:length(S1)
%                  if i1~=mod(p-1-j,p)
%                     i1=mod(S1(n)+j,p);
%                  else
%                     i1=j-1; 
%                  end
%                  i3=mod(3*i1-2*i0,p);                                                                                          %Ri_Dm_Fq  Dm_Fq  Ri_Fq_H  Ri_Fq_I 把可能落到S3的值放入S0\S0填满
%                         if i3==mod(3*j-1,p) && i3~=mod(3*i1+2,p) && i3~=mod(2*i0+3,p) && i3~=mod((-i0-3)*invert(2,p),p) 
%                            S0(end+1)=mod(p-1-3*j,p);
%                         end
%                         if i3~=mod(3*j-1,p) && i3~=mod(3*i1+2,p) && i3~=mod(2*i0+3,p) && i3~=mod((-i0-3)*invert(2,p),p)
%                            S0(end+1)=mod(i3-3*j,p);  
%                         end
%                         if ismember(S0(end),S0(1:end-1))==1 || ismember(S0(end),S1(1:end))==1
%                          S0(end)=[];
%                         end    
%                       if length(S0)==floor((p-1)/4)
%                           break;
%                       end
%              end
%         if length(S0)==floor((p-1)/4)
%            break;
%         end
%      end
%     
%     if length(S0)<floor((p-1)/4)
%         for m = 1:length(Q1)
%              i0=Q1(m);
%              for n = 1:length(S1)
%                  if i1~=mod(p-1-j,p)
%                     i1=mod(S1(n)+j,p);
%                  else
%                     i1=j-1; 
%                  end
%                  for j1=0:p-1
%                      i3=mod(p-1+j1,p);
%                      if i3==mod(3*j-1,p) && i3==i1+2*j1  &&  i3==i0+3*j1                                                             %Ri_Dm_Fq_I
%                         S0(end+1)=mod(p-1-3*j,p); 
%                      end
%                      if i3~=mod(3*j-1,p) && i3==i1+2*j1  &&  i3==i0+3*j1
%                         S0(end+1)=mod(i3-3*j,p);   
%                      end
%                      if ismember(S0(end),S0(1:end-1))==1 || ismember(S0(end),S1(1:end))==1
%                          S0(end)=[];
%                      end 
%                    if length(S0)==floor((p-1)/4)
%                           break;
%                    end        
%                 end
%             end
%         end
%     end
% end
% S0
% %%%%%%%%%%%%%%%%填满S3
% while length(S3)<ceil((p-1)/4)
%       for m = 1:length(S0)
%           i0=S0(m);
%           for n = 1:length(S1)
%               if i1~=mod(p-1-j,p)
%                  i1=mod(S1(n)+j,p);
%               else
%                  i1=j-1; 
%               end
%                  i2=mod(2*i1-i0,p);                                                                                          %Ri_Dm_En  Ri_En_H  En_Dm Ri_En_J 把可能落到S3的值放入S0\S0填满
%                         if i2==mod(2*j-1,p) && i2~=mod(i0+2,p) && i2~=mod((2*i1+1),p) && i2~=mod((i0-2)*invert(3,p),p) 
%                            S3(end+1)=mod(p-1-2*j,p);
%                         end
%                         if i2~=mod(2*j-1,p) && i2~=mod(i0+2,p) && i2~=mod((2*i1+1),p) && i2~=mod((i0-2)*invert(3,p),p) 
%                            S3(end+1)=mod(i2-2*j,p);  
%                         end
%                         if ismember(S3(end),S3(1:end-1))==1 || ismember(S3(end),S1(1:end))==1 || ismember(S3(end),S0(1:end))==1
%                          S3(end)=[];
%                         end    
%                       if length(S3)==ceil((p-1)/4)
%                           break;
%                       end
%              end
%         if length(S3)==ceil((p-1)/4)
%            break;
%         end
%       end
% end
% S2=remove_4(U,S0,S1,S3);
% disp('*****************');
% disp('分配修复位需要的奇偶校验集合号:S0 S1 S2 S3');
% disp(S0);
% disp(S1);
% disp(S2);
% disp(S3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%交点统计——不考虑公共因子可被集合slop-r修复
% %%%%交点可能涉及失效列j的值——直接统计R_D、R_E、 R_F || D_E、 D_F、 E_F交点个数
% %R_D
% countR_D=0;                                              %Ri_D'一定有交点;Ri_H 不一定有交点;当S0(n0)取得H即是公共因子的数、位置，就不可下载此位置的数
% for n0=1:length(S0)
%     if mod(p-1-j,p)==S0(n0)
%         countR_D=countR_D+1;
%     end
% end
% % for n0=1:length(S0)
% %     if mod(p-1-S0(n0),p)==j
% %        countR_D=countR_D+1;
% %     end
% % end
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
% % R_F
% countR_F=0;
% for n0=1:length(S0)
%     if mod(p-1-3*j,p)==S0(n0)
%         countR_F=countR_F+1;
%     end
% end
% countR_F=length(S0)*length(S2)+length(S0)-countR_F;
% 
% % D_E
% %%检验Dm_En是否可能存在交点 %交点个数
% count1=1;
% D_E=[];
% D_EM=[];              %%交点下标
% for n1=1:length(S1)
%     for n2=1:length(S2)
%         if mod((2*S1(n1)-S2(n2)),p)~=p-1
%             D_E(count1,:)=[S1(n1) S2(n2)];
%             if(mod(S2(n2)-S1(n1)+j,p)~=j)
%                D_EM(count1,:)=[mod(2*(j+S1(n1))-(2*j+S2(n2)),p) mod(S2(n2)+2*j-S1(n1)-j,p)];
%                count1=count1+1;
%             end
%         end
%     end
% end
% disp('********************************');
% disp('检验Dm_En是否可能存在交点_希望有的交点,不满足条件的话交点无_这里统计有交点的组合、个数、坐标标记');
% disp(D_E);
% disp(D_EM);
% %%交点可能涉及失效列j的值
% countD_E=0;
% for n1=1:length(S1)                        %% D'm_I  
%     if mod(p-1-2*j,p)==S1(n1)
%        countD_E=countD_E+1;
%     end
% end
% for n2=1:length(S2)                        %%E'n_H
%     if mod(p-1-j,p)==S2(n2)
%        countD_E=countD_E+1;
%     end
% end
% countD_E=(count1-1)+length(S1)+length(S2)-countD_E;
% 
% % D_F
% %%检验Dm_Fq是否可能存在交点 %交点个数
% count2=1;
% D_F=[];               %%交点m n集合选择
% D_FM=[];              %%交点下标
% for n1=1:length(S1)
%     for n3=1:length(S3)
%         if mod((3*(S1(n1)+j)-(S3(n3)+3*j))*invert(2,p),p)~=p-1
%             D_F(count2,:)=[S1(n1),S3(n3)];
%             if(mod((S3(n3)+j*3-S1(n1)-j)*invert(2,p),p)~=j)
%                D_FM(count2,:)=[mod((3*S1(n1)-S3(n3))*invert(2,p),p) mod((S3(n3)+j*3-S1(n1)-j)*invert(2,p),p)];
%                count2=count2+1;
%             end
%         end
%     end
% end
% disp('*****************');
% disp('检验Dm_Fq是否可能存在交点_希望有的交点,不满足条件的话交点无_这里统计有交点的组合、个数、坐标标记');
% disp(D_F);
% disp(D_FM);
% %%交点可能涉及失效列j的值
% countD_F=0;                             
% for n3=1:length(S3)                    %% F'q_H
%     if mod(p-1-j,p)==S3(n3)
%        countD_F=countD_F+1;
%     end
% end
% for n1=1:length(S1)                    %% D'm_J 
%     if mod(p-1-3*j,p)==S1(n1)
%        countD_F=countD_F+1;
%     end
% end
% countD_F=(count2-1)+length(S1)+length(S3)-countD_F;
% % E_F
% %%检验En_Fq是否可能存在交点 %交点个数
% count3=1;
% E_F=[];               %%交点m n集合选择
% E_FM=[];              %%交点下标
% for n2=1:length(S2)
%     for n3=1:length(S3)
%         if mod((3*(S2(n2)+2*j)-2*(S3(n3)+3*j)),p)~=p-1
%             E_F(count3,:)=[S2(n2),S3(n3)];
%             if(mod(3*j+S3(n3)-j*2-S2(n2),p)~=j)
%                E_FM(count3,:)=[mod((3*S2(n2)-2*S3(n3)),p) mod(3*j+S3(n3)-j*2-S2(n2),p)];
%                count3=count3+1;
%             end
%         end
%     end
% end
% disp('****************');
% disp('检验En_Fq是否可能存在交点_希望有的交点,不满足条件的话交点无_这里统计有交点的组合、个数、坐标标记');
% disp(E_F);
% disp(E_FM);
% %%交点可能涉及失效列j的值
% countE_F=0;                            
% for n3=1:length(S3)
%     if mod(p-1-2*j,p)==S3(n3)          %% F'q_I
%        countE_F=countE_F+1;
%     end
% end
% for n2=1:length(S2)                     %% E'n_J 
%     if mod(p-1-3*j,p)==S2(n2)
%        countE_F=countE_F+1;
%     end
% end
% countE_F=(count3-1)+length(S2)+length(S3)-countE_F;
% 
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
% disp('****************');
% disp('R_D_E交点选择');
% disp(R_D_E);
% disp('R_D_E交点坐标');
% disp(R_D_EM);
% 
% % R_Dm'_I
% R_D_I=[];
% R_D_IM=[]; 
% count5=1;
% for n1=1:length(S1)
%     if S1(n1)~=mod(p-1-2*j,p)
%        for n0=1:length(S0)
%            if S0(n0)==mod(2*(j+S1(n1))+1,p)
%               R_D_I(count5,:)=[S0(n0) S1(n1)];
%               if mod(-(j+S1(n1))-1,p)~=j
%                  R_D_IM(count5,:)=[S0(n0) mod(-(j+S1(n1))-1,p)];
%                  count5=count5+1;
%               end
%            end
%        end
%     end
% end
% disp('****************')
% disp('R_D_I交点选择');
% disp(R_D_I);
% disp('R_D_I交点坐标');
% disp(R_D_IM);
% 
% % R_En'_H
% R_E_H=[];
% R_E_HM=[]; 
% count6=1;
% for n2=1:length(S2)
%     if S2(n2)~=mod(p-1-j,p)
%        for n0=1:length(S0)
%            if S0(n0)==mod(-2-2*j-S2(n2),p)
%               R_E_H(count6,:)=[S0(n0) S2(n2)];
%               if mod(2*j+S2(n2)+1,p)~=j
%                 R_E_HM(count6,:)=[S0(n0) mod(2*j+S2(n2)+1,p)];
%                 count6=count6+1;
%               else
%                  R_E_H=[];
%               end
%            end
%        end
%     end
% end
% disp('****************');
% disp('R_En1_H交点选择');
% disp(R_E_H);
% disp('R_En1_H交点坐标');
% disp(R_E_HM);
% %%%%%%%%%%%%%%%%% R_D_E=Ri_Dm'_En'+ Ri_Dm_I + R_En'_H
% countR_D_E=(count4-1)+(count5-1)+(count6-1);
% 
% 
% %%%%%%%%%%%%%%%%R_D_F
% % Ri_Dm'_Fq'
% R_D_F=[];
% R_D_FM=[]; 
% count7=1;
% for n0=1:length(S0)
%     if count2>1
%     for Mark=1:count2-1
%           if D_FM(Mark,1)==S0(n0)
%              R_D_F(count7,:)=[S0(n0) D_F(Mark,1) D_F(Mark,2)];
%              if(D_FM(Mark,2)~=j)
%                 R_D_FM(count7,:)=[S0(n0) D_FM(Mark,2)];
%                 count7=count7+1;
%              end
%           end  
%     end
%     end
% end
% disp('****************');
% disp('R_D1_F1交点选择');
% disp(R_D_F);
% disp('R_D1_F1交点坐标');
% disp(R_D_FM);
% 
% % R_Dm'_J
% R_D_J=[];
% R_D_JM=[]; 
% count8=1;
% for n1=1:length(S1)
%     if S1(n1)~=mod(p-1-3*j,p)
%        for n0=1:length(S0)
%            if S0(n0)==mod((3*(j+S1(n1))+1)*invert(2,p),p)
%               R_D_J(count8,:)=[S0(n0) S1(n1)];
%               if mod(-(j+S1(n1))-1,p)~=j
%                  R_D_JM(count8,:)=[S0(n0) mod(-(j+S1(n1))-1,p)];
%                  count8=count8+1;
%               end
%            end
%        end
%     end
% end
% disp('****************');
% disp('R_D1_J交点选择');
% disp(R_D_J);
% disp('R_D1_J交点坐标');
% disp(R_D_JM);
% 
% % R_Fq'_H
% R_F_H=[];
% R_F_HM=[]; 
% count9=1;
% for n3=1:length(S3)
%     if S3(n3)~=mod(p-1-j,p)
%        for n0=1:length(S0)
%            if S0(n0)==mod((-3-3*j-S3(n3))*invert(2,p),p)
%               R_F_H(count9,:)=[S0(n0) S3(n3)];
%               if mod((3*j+S3(n3)+1)*invert(2,p),p)~=j
%                 R_F_HM(count9,:)=[S0(n0) mod((3*j+S3(n3)+1)*invert(2,p),p)];
%                 count9=count9+1;
%               end
%            end
%        end
%     end
% end
% disp('****************');
% disp('R_F1_H交点选择');
% disp(R_F_H);
% disp('R_F1_H交点坐标');
% disp(R_F_HM);
% %%%%%%%%%%%%%%%%% R_D_F=Ri_Dm'_Fq'+ Ri_Dm_J + R_Fq'_I
% countR_D_F=(count7-1)+(count8-1)+(count9-1);
% 
% 
% %%%%%%%%%%%%%%%%R_E_F
% % Ri_En'_Fq'
% R_E_F=[];
% R_E_FM=[]; 
% count10=1;
% for n0=1:length(S0)
%     if count3>1
%     for Mark=1:count3-1
%           if E_FM(Mark,1)==S0(n0)
%              R_E_F(count10,:)=[S0(n0) E_F(Mark,1) E_F(Mark,2)];
%              if(E_FM(Mark,2)~=j)
%                 R_E_FM(count10,:)=[S0(n0) E_FM(Mark,2)];
%                 count10=count10+1;
%              end
%           end  
%     end
%     end
% end
% disp('****************');
% disp('R_E1_F1交点选择');
% disp(R_E_F);
% disp('R_E1_F1交点坐标');
% disp(R_E_FM);
% 
% % R_En'_J
% R_E_J=[];
% R_E_JM=[]; 
% count11=1;
% for n2=1:length(S2)
%     if S2(n2)~=mod(p-1-3*j,p)
%        for n0=1:length(S0)
%            if S0(n0)==mod((3*(2*j+S2(n1))+2),p)
%               R_E_J(count11,:)=[S0(n0) S2(n2)];
%               if mod(-(2*j+S2(n2))-1,p)~=j
%                  R_E_JM(count11,:)=[S0(n0)  mod(-(2*j+S2(n2))-1,p)];
%                  count11=count11+1;
%               end
%            end
%        end
%     end
% end
% disp('****************');
% disp('R_E1_J交点选择');
% disp(R_E_J);
% disp('R_E1_J交点坐标');
% disp(R_E_JM);
% 
% % R_Fq'_I
% R_F_I=[];
% R_F_IM=[]; 
% count12=1;
% for n3=1:length(S3)
%     if S3(n3)~=mod(p-1-2*j,p)
%        for n0=1:length(S0)
%            if S0(n0)==mod(-2*(3*j+S3(n3))-3,p)
%               R_F_I(count12,:)=[S0(n0) S3(n3)];
%               if mod((3*j+S3(n3)+1),p)~=j
%                 R_F_IM(count12,:)=[S0(n0) mod((3*j+S3(n3)+1),p)];
%                 count12=count12+1;
%               end
%            end
%        end
%     end
% end
% disp('****************');
% disp('R_F1_I交点选择');
% disp(R_F_I);
% disp('R_F1_I交点坐标');
% disp(R_F_IM);
% %%%%%%%%%%%%%%%%% R_D_F=Ri_Dm'_Fq'+ Ri_Dm_J + R_Fq'_I
% countR_E_F=(count10-1)+(count11-1)+(count12-1);
% 
% %%%%%%%%%%%%%%%%D_E_F
% % Dm_En'_Fq'
% D_E_F=[];
% D_E_FM=[]; 
% count13=1;
% for n1=1:length(S1)
%     for n2=1:length(S2)
%         for n3=1:length(S3)
%             for j1=0:p-1
%                 if mod((2*j+S2(n2))-2*j1,p)==mod((j+S1(n1))-j1,p)  && mod((j+S1(n1))-j1,p)==mod((3*j+S3(n3))-3*j1,p)
%                    D_E_F(count13,:)=[S1(n1) S2(n2) S3(n3)];
%                    if(j1~=j)
%                       D_E_FM(count13,:)=[mod((j+S1(n1))-j1,p) mod(j1,p)];
%                       count13=count13+1;
%                    end
%                 end
%              end
%          end  
%      end
% end
% disp('****************');
% disp('D_E1_F1交点选择');
% disp(D_E_F);
% disp('D_E1_F1交点坐标');
% disp(D_E_FM);
% 
% % Dm_En'_J
% D_E_J=[];
% D_E_JM=[]; 
% count14=1;
% for n1=1:length(S1)
%     for n2=1:length(S2)
%         for j1=0:p-1
%             if mod((2*j+S2(n2))-2*j1,p)==mod((j+S1(n1))-j1,p)  && mod((j+S1(n1))-j1,p)==mod(p-1-3*j1,p)
%                D_E_J(count14,:)=[S1(n1) S2(n2)];
%                    if(j1~=j)
%                       D_E_JM(count14,:)=[mod((j+S1(n1))-j1,p) j1];
%                       count14=count14+1;
%                    end
%             end
%         end
%     end  
% end
% disp('****************');
% disp('D_E1_J交点选择');
% disp(D_E_J);
% disp('D_E1_J交点坐标');
% disp(D_E_JM);
% 
% % Dm'_Fq'_I
% D_F_I=[];
% D_F_IM=[]; 
% count15=1;
% for n1=1:length(S1)
%     for n3=1:length(S3)
%         for j1=0:p-1
%             if mod((3*j+S3(n3))-3*j1,p)==mod((j+S1(n1))-j1,p)  && mod((j+S1(n1))-j1,p)==mod(p-1-2*j1,p)
%                D_F_I(count15,:)=[S1(n1) S3(n3)];
%                 if(j1~=j)
%                       D_F_IM(count15,:)=[mod((j+S1(n1))-j1,p) j1];
%                       count15=count15+1;
%                 end
%             end
%         end
%     end  
% end
% disp('****************');
% disp('D1_F1_I交点选择');
% disp(D_F_I);
% disp('D1_F1_I交点坐标');
% disp(D_F_IM);
% 
% % En'_Fq'_H
% E_F_H=[];
% E_F_HM=[]; 
% count16=1;
% for n2=1:length(S2)
%     for n3=1:length(S3)
%         for j1=0:p-1
%             if mod((3*j+S3(n3))-3*j1,p)==mod((2*j+S2(n2))-2*j1,p)  && mod((2*j+S2(n2))-2*j1,p)==mod(p-1-j1,p)
%                 E_F_H(count16,:)=[S2(n2) S3(n3)];
%                 if(j1~=j)
%                       E_F_HM(count16,:)=[mod((2*j+S2(n2))-2*j1,p) j1];
%                       count16=count16+1;
%                 end
%             end
%         end
%     end  
% end
% disp('****************');
% disp('E1_F1_H交点选择');
% disp(E_F_H);
% disp('E1_F1_H交点坐标');
% disp(E_F_HM);
% %%%%%%%%%%%%%%%%% Dm_En_Fq=Dm'_Fq'_En' + Dm'_Eq'_J + Dm'_Fq'_I + En'_Fq'_H
% countD_E_F=(count13-1)+(count14-1)+(count15-1)+(count16-1);
% 
% %%%%%%%%%%%%%%%%% Ri_Dm_En_Fq
% % Ri_Dm'_En'_Fq'
% R_D_E_F=[];
% R_D_E_FM=[]; 
% count17=1;
% for n0=1:length(S0)
%     if count13>1;
%     for Mark=1:count13-1
%           if D_E_FM(Mark,1)==S0(n0)
%              R_D_E_F(count17,:)=[S0(n0) D_E_F(Mark,1) D_E_F(Mark,2)];
%              if(D_E_FM(Mark,2)~=j)
%                 R_D_E_FM(count17,:)=[S0(n0) D_E_FM(Mark,2)];
%                 count17=count17+1;
%              end
%           end  
%     end
%     end
% end
% disp('****************');
% disp('R_D1_E1_F1交点选择');
% disp(R_D_E_F);
% disp('R_D1_E1_F1交点坐标');
% disp(R_D_E_FM);
% 
% % Ri_Dm'_En'_J
% R_D_E_J=[];
% R_D_E_JM=[]; 
% count18=1;
% for n0=1:length(S0)
%     if count14>1
%     for Mark=1:count14-1
%           if D_E_JM(Mark,1)==S0(n0)
%              R_D_E_J(count18,:)=[S0(n0) D_E_J(Mark,1) D_E_J(Mark,2)];
%              if(D_E_JM(Mark,2)~=j)
%                 R_D_E_JM(count18,:)=[S0(n0) D_E_JM(Mark,2)];
%                 count18=count18+1;
%              end
%           end  
%     end
%     end
% end
% disp('****************');
% disp('R_D1_E1_J交点选择');
% disp(R_D_E_J);
% disp('R_D1_E1_J交点坐标');
% disp(R_D_E_JM);
% 
% % Ri_Dm'_Fq'_I
% R_D_F_I=[];
% R_D_F_IM=[]; 
% count19=1;
% for n0=1:length(S0)
%     if count15>1
%     for Mark=1:count15-1
%           if D_F_IM(Mark,1)==S0(n0)
%              R_D_F_I(count18,:)=[S0(n0) D_F_I(Mark,1) D_F_I(Mark,2)];
%              if(D_F_IM(Mark,2)~=j)
%                 R_D_F_IM(count18,:)=[S0(n0) D_F_IM(Mark,2)];
%                 count18=count18+1;
%              end
%           end  
%     end
%     end
% end
% disp('****************');
% disp('R_D1_F1_I交点选择');
% disp(R_D_F_I);
% disp('R_D1_F1_I交点坐标');
% disp(R_D_F_IM);
% 
% % Ri_En'_Fq'_H
% R_E_F_H=[];
% R_E_F_HM=[];
% count20=1;
% for n0=1:length(S0)
%     if count16>1
%     for Mark=1:count16-1
%           if E_F_HM(Mark,1)==S0(n0)
%              R_E_F_H(count20,:)=[S0(n0) E_F_H(Mark,1) E_F_H(Mark,2)];
%              if(E_F_HM(Mark,2)~=j)
%                 R_E_F_HM(count20,:)=[S0(n0) E_F_HM(Mark,2)];
%                 count20=count20+1;
%              end
%           end  
%     end
%     end
% end
% disp('****************');
% disp('R_E1_F1_H交点选择');
% disp(R_E_F_H);
% disp('R_E1_F1_H交点坐标');
% disp(R_E_F_HM);
% %%%%%%%%%%%%%%%%% Ri_Dm_En_Fq=Ri_Dm'_Fq'_En' + Ri_Dm'_Eq'_J + Ri_Dm'_Fq'_I + Ri_En'_Fq'_H
% countR_D_E_F=(count17-1)+(count18-1)+(count19-1)+(count20-1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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
disp('********************************');
disp('检验Dm_En是否可能存在交点_希望有的交点,不满足条件的话交点无_这里统计有交点的组合、个数、坐标标记');
disp(D_E);
disp(D_EM);

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
disp('*****************');
disp('检验Dm_Fq是否可能存在交点_希望有的交点,不满足条件的话交点无_这里统计有交点的组合、个数、坐标标记');
disp(D_F);
disp(D_FM);
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
disp('****************');
disp('检验En_Fq是否可能存在交点_希望有的交点,不满足条件的话交点无_这里统计有交点的组合、个数、坐标标记');
disp(E_F);
disp(E_FM);
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
disp('****************');
disp('R_D_E交点选择');
disp(R_D_E);
disp('R_D_E交点坐标');
disp(R_D_EM);

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
disp('****************')
disp('R_D_I交点选择');
disp(R_D_I);
disp('R_D_I交点坐标');
disp(R_D_IM);

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
disp('****************');
disp('R_En1_H交点选择');
disp(R_E_H);
disp('R_En1_H交点坐标');
disp(R_E_HM);
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
disp('****************');
disp('R_D1_F1交点选择');
disp(R_D_F);
disp('R_D1_F1交点坐标');
disp(R_D_FM);

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
disp('****************');
disp('R_D1_J交点选择');
disp(R_D_J);
disp('R_D1_J交点坐标');
disp(R_D_JM);

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
disp('****************');
disp('R_F1_H交点选择');
disp(R_F_H);
disp('R_F1_H交点坐标');
disp(R_F_HM);
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
disp('****************');
disp('R_E1_F1交点选择');
disp(R_E_F);
disp('R_E1_F1交点坐标');
disp(R_E_FM);

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
disp('****************');
disp('R_E1_J交点选择');
disp(R_E_J);
disp('R_E1_J交点坐标');
disp(R_E_JM);

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
disp('****************');
disp('R_F1_I交点选择');
disp(R_F_I);
disp('R_F1_I交点坐标');
disp(R_F_IM);
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
             D_E_F(count13,:)=[D_E(Mark,1) D_E(Mark,2) S3(n)];
             if(D_EM(Mark,2)~=j)
                D_E_FM(count13,:)=[D_EM(Mark,1) D_EM(Mark,2)];
                count4=count4+1;
             end
          end  
    end
    end
end
disp('****************');
disp('D_E1_F1交点选择');
disp(D_E_F);
disp('D_E1_F1交点坐标');
disp(D_E_FM);

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
disp('****************');
disp('D_E1_J交点选择');
disp(D_E_J);
disp('D_E1_J交点坐标');
disp(D_E_JM);

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
disp('****************');
disp('D1_F1_I交点选择');
disp(D_F_I);
disp('D1_F1_I交点坐标');
disp(D_F_IM);

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
disp('****************');
disp('E1_F1_H交点选择');
disp(E_F_H);
disp('E1_F1_H交点坐标');
disp(E_F_HM);
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
disp('****************');
disp('R_D1_E1_F1交点选择');
disp(R_D_E_F);
disp('R_D1_E1_F1交点坐标');
disp(R_D_E_FM);

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
disp('****************');
disp('R_D1_E1_J交点选择');
disp(R_D_E_J);
disp('R_D1_E1_J交点坐标');
disp(R_D_E_JM);

% Ri_Dm'_Fq'_I
R_D_F_I=[];
R_D_F_IM=[]; 
count19=1;
for n0=1:length(S0)
    if count15>1
    for Mark=1:count15-1
          if D_F_IM(Mark,1)==S0(n0)
             R_D_F_I(count19,:)=[S0(n0) D_F_I(Mark,1) D_F_I(Mark,2)];
             if(D_F_IM(Mark,2)~=j)
                R_D_F_IM(count19,:)=[S0(n0) D_F_IM(Mark,2)];
                count19=count19+1;
             end
          end  
    end
    end
end
disp('****************');
disp('R_D1_F1_I交点选择');
disp(R_D_F_I);
disp('R_D1_F1_I交点坐标');
disp(R_D_F_IM);

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
disp('****************');
disp('R_E1_F1_H交点选择');
disp(R_E_F_H);
disp('R_E1_F1_H交点坐标');
disp(R_E_F_HM);
%%%%%%%%%%%%%%%%% Ri_Dm_En_Fq=Ri_Dm'_Fq'_En' + Ri_Dm'_Eq'_J + Ri_Dm'_Fq'_I + Ri_En'_Fq'_H
countR_D_E_F=(count17-1)+(count18-1)+(count19-1)+(count20-1);


%(evenodd(p,4))实际下载块____修复下限____evenodd(p,2)修复下限__evenodd(p,3)修复下限
%evenodd(p,4)修复下限
if mod((p-1),4)==0
    if(j==0)
    limit_4=ceil((5*(p^2)-2*p-3)/8);
    %limit_4=length(S0)*p+length(S1)*(p-1)+(p-1)+length(S2)*(p-1)+(p-1)+length(S3)*(p-1)+(p-1)-(length(S0)*length(S1)+length(S0))-(length(S0)*length(S2)+length(S0))-(length(S0)*length(S3)+length(S0))-(length(S1)*length(S2)+length(S1)+length(S2))-(length(S1)*length(S3)+length(S1)+length(S3))-(length(S2)*length(S3)+length(S2)+length(S3));
    download=length(S0)*p+length(S1)*(p-1)+(p-1)+length(S2)*(p-1)+(p-1)+length(S3)*(p-1)+(p-1)-countR_D-countR_E-countR_F-countD_E-countD_F-countE_F+countR_D_E+countR_D_F+countR_E_F+countD_E_F-countR_D_E_F;
    else
    limit_4=ceil((5*(p^2)-2*p-3)/8-3);
     download=length(S0)*p+length(S1)*(p-1)++(p-2)+length(S2)*(p-1)+(p-2)+length(S3)*(p-1)+(p-2)-countR_D-countR_E-countR_F-countD_E-countD_F-countE_F+countR_D_E+countR_D_F+countR_E_F+countD_E_F-countR_D_E_F;
    end
else
    if(j==0)
     limit_4=ceil((5*(p^2)-2*p+1)/8);
     %limit_4=(p-1)^2+(p-1)-(((p-3)/4)^2+4*(p-3)/4*(p+1)/4+((p+1)/4)^2);
     %limit_4=(p-1)^2+(p-1)-(length(S0)*length(S1)+length(S0)*length(S2)+length(S0)*length(S3)+length(S1)*length(S2)+length(S1)*length(S3)+length(S2)*length(S3));
     %limit_4=length(S0)*p+length(S1)*(p-1)+(p-1)+length(S2)*(p-1)+(p-1)+length(S3)*(p-1)+(p-1)-(length(S0)*length(S1)+length(S0))-(length(S0)*length(S2)+length(S0))-(length(S0)*length(S3)+length(S0))-(length(S1)*length(S2)+length(S1)+length(S2))-(length(S1)*length(S3)+length(S1)+length(S3))-(length(S2)*length(S3)+length(S2)+length(S3));
     download=length(S0)*p+length(S1)*(p-1)+(p-1)+length(S2)*(p-1)+(p-1)+length(S3)*(p-1)+(p-1)-countR_D-countR_E-countR_F-countD_E-countD_F-countE_F+countR_D_E+countR_D_F+countR_E_F+countD_E_F-countR_D_E_F;
    else
     limit_4=ceil((5*(p^2)-2*p+1)/8-3);
     download=length(S0)*p+length(S1)*(p-1)++(p-2)+length(S2)*(p-1)+(p-2)+length(S3)*(p-1)+(p-2)-countR_D-countR_E-countR_F-countD_E-countD_F-countE_F+countR_D_E+countR_D_F+countR_E_F+countD_E_F-countR_D_E_F;
    end
end
download
% 
% %evenodd(p,3)修复下限
% if mod((p-1),3)==0
%     if(j==0)
%     limit_3=(2*(p^2)-p-1)/3;
%     else
%     limit_3=((2*(p^2)-p-1)/3)-2;
%     end
% else
%     if(j==0)
%      limit_3=(2*(p^2)-p)/3;
%     else
%      limit_3=(2*(p^2)-p)/3-2;
%     end
% end
% 
% %evenodd(p,2)修复下限
% limit_2=(3*(p^2)-2*p-1)/4;
% 
% %evenodd(p,3)实际下载块
% download_3=distribute_func(p,j,ord);
% 
% download_4=testp_4( p,j,ord,ord1);
% 
% disp('********************************');
% disp('方案二evenodd(p,4)实际下载块');
% disp(download);
% disp('方案一evenodd(p,4)实际下载块');
% disp(download_4);
% disp('evenodd(p,3)实际下载块');
% disp(download_3);
% disp('evenodd(p,4)修复下限');
% disp(limit_4);
% disp('evenodd(p,3)修复下限');
% disp(limit_3);
% disp('evenodd(p,2)修复下限');
% disp(limit_2);




% % %%%%%%%%%%%%画图
% clc
% clear
% limit=[];
% download_4=[];
% x=[];
% limit_1=[];
% count=1;
% for p=5:100
%     if isprime(p)==1
%        for M=1:p
%           if(mod(2^0-1,p)==mod(2^M-1,p))
%              ord=M;
%              break;
%           end
%        end
%        for N=1:p
%           if(mod(3^0-1,p))==mod(3^N-1,p)
%              ord1=N;
%              break;
%           end
%        end
%       [download2_4(count),limit2_2(count),limit2_3(count),limit2_4(count)]= distribute1_func( p,1,ord,ord1);
%       [download1_4(count),limit1_2(count),limit1_3(count),limit1_4(count)]= testp_4( p,1,ord,ord1);
%       download_3(count)=distribute_func(p,1,ord);
%       x(count)=p;
%       count=count+1;
%     end
% end
% figure(1);
% %plot(x,limit,'kx-',x,download1_4,'*-r',x,limit_1,'+-',x,limit1_4,'o-')
% plot(x,download2_4,'*-r',x,download_3,'*-b',x,limit2_2,'kx-',x,limit2_3,'+-',x,limit2_4,'+-')
% %plot(x,download2_4,'*-r',x,download_3,'kx-',x,limit2_3,'+-',x,limit2_4,'--')
% legend({'The Number of Disk Reads of Algorithm_4','The Number of Disk Reads of Algorithm_3','Lower Bound on Disk Reads of EVENODD(p,2) code','Lower Bound on Disk Reads of EVENODD(p,3) code','Lower Bound on Disk Reads of EVENODD(p,4) code'},'FontSize',8,'Location','Northwest');
% %axis([0 100 0 5000]);
% xlabel('Disk Array Size','Fontsize',16); ylabel('Disk Read Number','Fontsize',16);
% 
% figure(2);
% plot(x,(download_3-download2_4),'x-')
% axis([0 100 -10 200]);
% xlabel('Disk Array Size'); ylabel('The difference value D3_D4');
% 
% figure(3);
% plot(x,(download_3-download1_4),'x-')
% axis([0 100 -10 200]);
% xlabel('Disk Array Size'); ylabel('The difference value D3_D4');
% 
% % figure(3);
% % plot(x,(download2_4-limit1_3),'x-',x,(download_3-limit1_3),'*-')
% % legend({'download_4-limit_3','download_3-limit_3','download_4-limit_4','limit_2-download_4'},'FontSize',8,'Location','Northwest');
% % axis([0 100 -10 500]);
% % xlabel('Disk Array Size'); ylabel('The difference value D4_L3/D3_L3');
% 
% % figure(4);
% % plot(x,(download2_4-limit2_4),'x-',x,(download_3-download2_4),'*-')
% % legend({'download_4-limit_4','download_3-download_4'},'FontSize',8,'Location','Northwest');
% % axis([0 100 -20 500]);
% % xlabel('Disk Array Size'); ylabel('The difference value');
% 
% figure(5);
% plot(x,download2_4,'kx-',x,download1_4,'*-r',x,download2_4-download1_4,'*-')
% plot(x,download1_4-download2_4,'*-')
% axis([0 100 -50 50]);
% legend('集合方案二','集合方案一','集合方案二减集合方案一');
% legend('集合方案一减集合方案二');
% xlabel('磁盘数'); ylabel('修复实际下载量');
