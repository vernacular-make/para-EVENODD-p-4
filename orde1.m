% p=51;
% for N=1:p
%     if(mod(3^0-1,p))==mod(3^N-1,p)
%         ord1=N;
%         break;
%     end
% end
% ord1
clc;
clear;
% p=input('«Î ‰»Î“ªÀÿ ˝p£∫');
% for i=0:p-2
%     U(i+1)=i;
% end
% 
% H=[1];
% H1=[1];
% for M=1:p
%     if mod(2^M,p) < p
%        H(end+1)=mod(2^M,p);
%        if ismember(H(end),H(1:end-1))==1
%            H(end)=[];
%            break;
%        end
%     end
% end
% H
% length(H)
% 
% 
% for M=1:p
%     if(mod(2^0-1,p)==mod(2^M-1,p))
%         ord=M;
%         break;
%     end
% end
% ord
% 
% for N=1:p
%     if mod(3^N,p) < p
%        H1(end+1)=mod(3^N,p);
%        if ismember(H1(end),H1(1:end-1))==1
%            H1(end)=[];
%            break;
%        end
%     end
% end
% H1
% length(H1)
% 
% for N=1:p
%     if(mod(3^0-2,p)==mod(3^N-2,p))
%         ord1=N;
%         break;
%     end
% end
% ord1

%%%%%%%%%%%%%%%%%%%%%
p=7;
j=1;
S3=[3,2];
for n3=1:length(S3)
    mod(p-1-3*j,p)
    if  S3(n3)==mod(p-1-3*j,p) && j~=0
        L3=length(S3)*(p-1)+1;
        break;
    else
        L3=length(S3)*(p-1);
    end
end

U=[0 1 2 3 4 5 6 7 8 9 10];
A=[0 1];
B=[2 3];
C=[6 4];
E=[7 8];

index = false(size(U));
for i = 1:length(A)
res = (U == A(i));
index = (index | res);
end
D = U(~index);

index = false(size(D));
for i = 1:length(B)
res = (D== B(i));
index = (index | res);
end
D = D(~index);

index = false(size(D));
for i = 1:length(C)
res = (D== C(i));
index = (index | res);
end
D = D(~index);

index = false(size(D));
for i = 1:length(E)
res = (D== E(i));
remove_5(U,A,B,C,E);
index = (index | res);
end
D = D(~index);

