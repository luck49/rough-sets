function [ red ] = prreduce( dataset,dataD)
%Լ���㷨
%˼�룺ͨ���������򲻱�
%   Detailed explanation goes here

lowapproximationD = lowapproximationofD( dataset,dataD )

[n,m]=size(dataset);

red=[]; %���Լ����
%�ڲ���Ҫ��

for i=1:m
    tempdata=dataset;
    tempdata(:,i)=[];
    lowapproximationofDtempdata=lowapproximationofD( tempdata,dataD );
    if length(lowapproximationD{1})-length(lowapproximationofDtempdata{1})>0
       red=[red,i];
    end  
end

%�ⲿ��Ҫ��
C=[1:1:m];
B=setdiff(C,red);
lowapproximationofDred=lowapproximationofD(dataset(:,red),dataD);
templength=length(lowapproximationofDred{1});

while length(lowapproximationD{1})~=templength
    lowmaxlength=0;
    maxindex=1;
    for i=1:length(B)
        redtemp=[red B(i)];  %��B=C-red�е�Ԫ��������ӵ�redtemp
        lowapproximationofDmat=lowapproximationofD( dataset(:,redtemp),dataD );
        templength=length(lowapproximationofDmat{1});
        if lowmaxlength < templength
            lowmaxlength=templength;
            maxindex=i;
        end
        redtemp(length(redtemp))=[];  %����ӵ�redtemp��Ԫ���Ƴ���ȥ
    end
    red=[red,maxindex];
end

end

