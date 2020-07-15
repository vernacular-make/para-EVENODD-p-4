function [ C ] = remove( U,A,B) %%删除U里的A和B
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
index = false(size(U));
for i = 1:length(A)
res = (U == A(i));
index = (index | res);
end
C = U(~index);

index = false(size(C));
for i = 1:length(B)
res = (C== B(i));
index = (index | res);
end
C = C(~index);
end

