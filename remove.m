function [ C ] = remove( U,A,B) %%ɾ��U���A��B
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

