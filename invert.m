function [ b ] = invert( a,p) %a*b=1 mod p;
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
if gcd(a,p)     %首先满足互质
    for k=1:10000
        if  rem((p*(k-1)+1)/a,1)==0 &&(p*(k-1)+1)/a < p
            b=(p*(k-1)+1)/a;
            break;
        end
    end
end
end

