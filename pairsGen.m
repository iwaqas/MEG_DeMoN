function [ pairs ] = pairsGen( labels )
%PAIRGEN Summary of this function goes here
%   Detailed explanation goes here

numSnsrs=max(size(labels));
count=1;
pairs=0;

for i=1:numSnsrs
    for j=1:numSnsrs
        if(i~=j && i<j)
            pairs(count,1)=i;
            pairs(count,2)=j;
            count=count+1;
        end
    end
end
end