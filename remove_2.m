function [ C ] = remove_2( U,A) %%ɾ��U���A��B
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
index = false(size(U));
for i = 1:length(A)
res = (U == A(i));
index = (index | res);
end
C = U(~index);
end
