function [ result ] =settool( DMtemp )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%���a || b || c ��a || b ͬʱ���ڣ�ȥ�� a || b || c
i=1;
while i<=length(DMtemp)
    j=1;
    while j<=length(DMtemp)
        if i~=j
            if length(intersect(DMtemp{i},DMtemp{j}))==length(DMtemp{i})
                DMtemp(j)=[];
            elseif length(intersect(DMtemp{i},DMtemp{j}))==length(DMtemp{j})
                DMtemp(i)=[];
                break;
            else
                j=j+1;
            end
        else
            j=j+1;
        end
    end
    i=i+1;
end

result=DMtemp;

end

