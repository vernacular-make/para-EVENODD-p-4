function [ b ] = invert( a,p) %a*b=1 mod p;
%UNTITLED5 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if gcd(a,p)     %�������㻥��
    for k=1:10000
        if  rem((p*(k-1)+1)/a,1)==0 &&(p*(k-1)+1)/a < p
            b=(p*(k-1)+1)/a;
            break;
        end
    end
end
end

