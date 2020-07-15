function [ download,limit_2,limit_3,limit_4] = distribute1_func( p,j,ord,ord1)
%function [ download,limit_2,limit_3,limit_4] = distribute1_func( p,j)
%UNTITLED8 此处显示有关此函数的摘要
%   此处显示详细说明 
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
 
for N=1:p
    if(mod(3^0-1,p))==mod(3^N-1,p)
        ord1=N;
        break;
    end
end

%ord
%ord1
% c=0;
%%%%%%%%%%%%%%版本一：
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
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%分集合版本二：
while length(S1)<floor((p-1)/4)
    for k=0:(ord-1)                                                               %ord(2) 和p值的关系
        if mod(((i1+1)*(2^k)-1),p)==mod((p-1-j),p) 
           S0(end+1)=mod(((i1+1)*2^k-1),p);
          if ismember(S0(end),S0(1:end-1))==1                                      
             S0(end)=[];
          end
        else 
          S1(end+1)=mod(((i1+1)*2^k-1),p);                                        %m~=<p-1-j>  +<p-1-2*j>
          if length(S1)==floor((p-1)/4);
              if ismember(S1(end),S1(1:end-1))==1 
                 S1(end)=[];
              end
          end
          if length(S1)==floor((p-1)/4)  
             if k<ord-1                                                           %ord(2) 和p值的关系
                S0(end+1)=(mod(((i1+1)*(2^(k+1))-1),p));                          %S1放不下 k没结束，将与可能落在S2中一些关联数——<2m-n>=p-1,放入S0
                break;
             end
          end
        end
    end
     i1=min(remove(U,S0,S1));
end
Q1=S0; %开辟新的空间存储Q1
while length(S2)<ceil((p-1)/4)
     if length(Q1)==0
        Q1(end+1)=min(remove(U,S0,S1));
     end
     for k=0:(ord1-1)                                                              %ord1(3) 和p值的关系
           if k==0
             S2(end+1)=mod(((i2+1)*(3^k)-1),p);                                    %%m~=<p-1-j>  +<p-1-3*j>
             if ismember(S2(end),S2(1:end-1))==1 || ismember(S2(end),S0(1:end))==1 || ismember(S2(end),S1(1:end))==1
                S2(end)=[];
             end
           end
           for m = 1:length(Q1)
               i0=Q1(m);
              for n = 1:length(S1)
                  i1=S1(n);
                  if  mod(((i2+1)*(3^k)-1),p)~=mod(2*(i1+j)-i0-2*j,p) && mod(((i2+1)*(3^k)-1),p)~=mod(-2-i0-2*j,p) && mod(((i2+1)*(3^k)-1),p)~=mod((i0-2)*invert(3,p)-2*j,p) && length(S2)<ceil((p-1)/4)           %Ri_Dm_En // Ri_En_H
                      S2(end+1)=mod(((i2+1)*(3^k)-1),p);
                      if ismember(S2(end),S2(1:end-1))==1 || ismember(S2(end),S0(1:end))==1 || ismember(S2(end),S1(1:end))==1
                         S2(end)=[];
                      end
                  end
              end
           end
         if length(S2)==ceil((p-1)/4) && length(S0)< floor((p-1)/4)
            if k<ord1-1     
              S0(end+1)=mod(((i2+1)*(3^(k+1))-2)*invert(2,p),p);                                                           %En_Fq \ %S2放不下 k没结束，将与可能落在S3中一些关联数——<3n-2q>=p-1,放入S0
              if ismember(S0(end),S0(1:end-1))==1 || ismember(S0(end),S2(1:end))==1 || ismember(S0(end),S1(1:end))==1
                 S0(end)=[];
              end
              break;
            end
         end
    end
    i2=min(remove_4(U,S0,S1,S2));
end
Q0=S0;    %为S0开辟新的空间存储Q0 (复制)
 while  length(S0)<floor((p-1)/4)
     if length(Q0)==0
        Q0(end+1)=min(remove_4(U,S0,S1,S2));
     end
     for m = 1:length(Q0)
         i1=Q0(m);
         for n = 1:length(S2)
             i2=S2(n);
             for j1=0:p-1
                 if mod(i1+j-j1,p)==mod(i2+2*j-2*j1,p)                                      %Dm_En_Fq  避免落在S3的值 取出来放入S0 
                     i3=mod(i2-j+j1,p);
                     if ismember(i3,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/4)
                        S0(end+1)=i3;
                        if ismember(S0(end),S0(1:end-1))==1 
                            S0(end)=[];
                        end
                    end
                 end
             end
         end
     end
     if length(S0)<floor((p-1)/4)
        Q0=S0;
        for m = 1:length(Q0)
            i1=Q0(m);
            for n = 1:length(S2)
                i2=S2(n);
              for j1=0:p-1
                 if mod(i2+2*j-2*j1,p)==mod(p-1-j1,p)                                       %Dm_Fq_H   避免落在S3的值 取出来放入S0 
                    i3=mod(-1+2*j1-3*j,p);
                    if ismember(i3,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/4)
                       S0(end+1)=i3;
                       if ismember(S0(end),S0(1:end-1))==1 
                          S0(end)=[];
                       end
                    end
                 end
              end
            end
        end
     end  
     if length(S0)<floor((p-1)/4)
        Q0=S0;
        for m = 1:length(Q0)
            i1=Q0(m);
                for j1=0:p-1
                    if mod(i1+j-j1,p)==mod(p-1-2*j1,p)  
                        i3=mod(-1+j1-3*j,p);                                                          %Dm_Fq_I   避免落在S3的值 取出来放入S0 
                        if ismember(i3,remove_4(U,S0,S1,S2))==1 && length(S0)<floor((p-1)/4)
                           S0(end+1)=i3;
                           if ismember(S0(end),S0(1:end-1))==1 
                               S0(end)=[];
                           end
                        end
                     end     
                end  
        end
     end
     if length(S0)==floor((p-1)/4)
        break;
     end
 end
S3=remove_4(U,S0,S1,S2);

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
    for n2=1:length(S2)
        if mod((2*S1(n1)-S2(n2)),p)~=p-1
            D_E(count1,:)=[S1(n1) S2(n2)];
            if(mod(S2(n2)-S1(n1)+j,p)~=j)
               D_EM(count1,:)=[mod(2*(j+S1(n1))-(2*j+S2(n2)),p) mod(S2(n2)+2*j-S1(n1)-j,p)];
               count1=count1+1;
            end
        end
    end
end

%%交点可能涉及失效列j的值
countD_E=0;
for n1=1:length(S1)                        %% D'm_I  
    if mod(p-1-2*j,p)==S1(n1)
       countD_E=countD_E+1;
    end
end
for n2=1:length(S2)                        %%E'n_H
    if mod(p-1-j,p)==S2(n2)
       countD_E=countD_E+1;
    end
end
countD_E=(count1-1)+length(S1)+length(S2)-countD_E;

% D_F
%%检验Dm_Fq是否可能存在交点 %交点个数
count2=1;
D_F=[];               %%交点m n集合选择
D_FM=[];              %%交点下标
for n1=1:length(S1)
    for n3=1:length(S3)
        if mod((3*(S1(n1)+j)-(S3(n3)+3*j))*invert(2,p),p)~=p-1
            D_F(count2,:)=[S1(n1),S3(n3)];
            if(mod((S3(n3)+j*3-S1(n1)-j)*invert(2,p),p)~=j)
               D_FM(count2,:)=[mod((3*S1(n1)-S3(n3))*invert(2,p),p) mod((S3(n3)+j*3-S1(n1)-j)*invert(2,p),p)];
               count2=count2+1;
            end
        end
    end
end

%%交点可能涉及失效列j的值
countD_F=0;                             %% F'q_H
for n3=1:length(S3)
    if mod(p-1-j,p)==S3(n3)
       countD_F=countD_F+1;
    end
end
for n1=1:length(S1)                    %% D'm_J 
    if mod(p-1-3*j,p)==S1(n1)
       countD_F=countD_F+1;
    end
end
countD_F=(count2-1)+length(S1)+length(S3)-countD_F;
% E_F
%%检验En_Fq是否可能存在交点 %交点个数
count3=1;
E_F=[];               %%交点m n集合选择
E_FM=[];              %%交点下标
for n2=1:length(S2)
    for n3=1:length(S3)
        if mod((3*(S2(n2)+2*j)-2*(S3(n3)+3*j)),p)~=p-1
            E_F(count3,:)=[S2(n2),S3(n3)];
            if(mod(3*j+S3(n3)-j*2-S2(n2),p)~=j)
               E_FM(count3,:)=[mod((3*S2(n2)-2*S3(n3)),p) mod(3*j+S3(n3)-j*2-S2(n2),p)];
               count3=count3+1;
            end
        end
    end
end

%%交点可能涉及失效列j的值
countE_F=0;                             %% F'q_I
for n3=1:length(S3)
    if mod(p-1-2*j,p)==S3(n3)
       countE_F=countE_F+1;
    end
end
for n2=1:length(S2)                     %% E'n_J 
    if mod(p-1-3*j,p)==S2(n2)
       countD_F=countD_F+1;
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
    if S1(n1)~=mod(p-1-2*j,p)
       for n0=1:length(S0)
           if S0(n0)==mod(2*(j+S1(n1))+1,p)
              R_D_I(count5,:)=[S0(n0) S1(n1)];
              if mod(-(j+S1(n1))-1,p)~=j
                 R_D_IM(count5,:)=[S0(n0) mod(-(j+S1(n1))-1,p)];
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
    if S2(n2)~=mod(p-1-j,p)
       for n0=1:length(S0)
           if S0(n0)==mod(-2-2*j-S2(n2),p)
              R_E_H(count6,:)=[S0(n0) S2(n2)];
              if mod(2*j+S2(n2)+1,p)~=j
                R_E_HM(count6,:)=[S0(n0) mod(2*j+S2(n2)+1,p)];
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
    if S1(n1)~=mod(p-1-3*j,p)
       for n0=1:length(S0)
           if S0(n0)==mod((3*(j+S1(n1))+1)*invert(2,p),p)
              R_D_J(count8,:)=[S0(n0) S1(n1)];
              if mod(-(j+S1(n1))-1,p)~=j
                 R_D_JM(count8,:)=[S0(n0) mod(-(j+S1(n1))-1,p)];
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
    if S3(n3)~=mod(p-1-j,p)
       for n0=1:length(S0)
           if S0(n0)==mod((-3-3*j-S3(n3))*invert(2,p),p)
              R_F_H(count9,:)=[S0(n0) S3(n3)];
              if mod((3*j+S3(n3)+1)*invert(2,p),p)~=j
                R_F_HM(count9,:)=[S0(n0) mod((3*j+S3(n3)+1)*invert(2,p),p)];
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
    if S2(n2)~=mod(p-1-3*j,p)
       for n0=1:length(S0)
           if S0(n0)==mod((3*(2*j+S2(n1))+2),p)
              R_E_J(count11,:)=[S0(n0) S2(n2)];
              if mod(-(2*j+S2(n2))-1,p)~=j
                 R_E_JM(count11,:)=[S0(n0)  mod(-(2*j+S2(n2))-1,p)];
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
    if S3(n3)~=mod(p-1-2*j,p)
       for n0=1:length(S0)
           if S0(n0)==mod(-2*(3*j+S3(n3))-3,p)
              R_F_I(count12,:)=[S0(n0) S3(n3)];
              if mod((3*j+S3(n3)+1),p)~=j
                R_F_IM(count12,:)=[S0(n0) mod((3*j+S3(n3)+1),p)];
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
for n1=1:length(S1)
    for n2=1:length(S2)
        for n3=1:length(S3)
            for j1=0:p-1
                if mod((2*j+S2(n2))-2*j1,p)==mod((j+S1(n1))-j1,p)  && mod((j+S1(n1))-j1,p)==mod((3*j+S3(n3))-3*j1,p)
                   D_E_F(count13,:)=[S1(n1) S2(n2) S3(n3)];
                   if(j1~=j)
                      D_E_FM(count13,:)=[mod((j+S1(n1))-j1,p) mod(j1,p)];
                      count13=count13+1;
                   end
                end
             end
         end  
     end
end

% Dm_En'_J
D_E_J=[];
D_E_JM=[]; 
count14=1;
for n1=1:length(S1)
    for n2=1:length(S2)
        for j1=0:p-1
            if mod((2*j+S2(n2))-2*j1,p)==mod((j+S1(n1))-j1,p)  && mod((j+S1(n1))-j1,p)==mod(p-1-3*j1,p)
               D_E_J(count14,:)=[S1(n1) S2(n2)];
                   if(j1~=j)
                      D_E_JM(count14,:)=[mod((j+S1(n1))-j1,p) j1];
                      count14=count14+1;
                   end
            end
        end
    end  
end

% Dm'_Fq'_I
D_F_I=[];
D_F_IM=[]; 
count15=1;
for n1=1:length(S1)
    for n3=1:length(S3)
        for j1=0:p-1
            if mod((3*j+S3(n3))-3*j1,p)==mod((j+S1(n1))-j1,p)  && mod((j+S1(n1))-j1,p)==mod(p-1-2*j1,p)
               D_F_I(count15,:)=[S1(n1) S3(n3)];
                if(j1~=j)
                      D_F_IM(count15,:)=[mod((j+S1(n1))-j1,p) j1];
                      count15=count15+1;
                end
            end
        end
    end  
end

% En'_Fq'_H
E_F_H=[];
E_F_HM=[]; 
count16=1;
for n2=1:length(S2)
    for n3=1:length(S3)
        for j1=0:p-1
            if mod((3*j+S3(n3))-3*j1,p)==mod((2*j+S2(n2))-2*j1,p)  && mod((2*j+S2(n2))-2*j1,p)==mod(p-1-j1,p)
                E_F_H(count16,:)=[S2(n2) S3(n3)];
                if(j1~=j)
                      E_F_HM(count16,:)=[mod((2*j+S2(n2))-2*j1,p) j1];
                      count16=count16+1;
                end
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

%evenodd(p,3)修复下限
if mod((p-1),3)==0
    if(j==0)
    limit_3=(2*(p^2)-p-1)/3;
    else
    limit_3=((2*(p^2)-p-1)/3)-2;
    end
else
    if(j==0)
     limit_3=(2*(p^2)-p)/3;
    else
     limit_3=(2*(p^2)-p)/3-2;
    end
end

%evenodd(p,2)修复下限
limit_2=(3*(p^2)-2*p-1)/4;
end