function [ D ] = remove_5( U,A,B,C,E) %%ɾ��U���A��B
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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
index = (index | res);
end
D = D(~index);

end