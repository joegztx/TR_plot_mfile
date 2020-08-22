function binmatrix=dec2binmatrix(decarray,n)
% argument
% decarray: decimal array
% n : size of array
s=fliplr(dec2bin(decarray));

[ms,ns]=size(s);
na=min(ns,n);
d=zeros(ms,n);
for i=1:ms
    for j=1:na
        d(i,j)=str2double(s(i,j));
    end
end
binmatrix=d;