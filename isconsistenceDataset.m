function [ flag ] = isconsistenceDataset(dataset, dataD )
%UNTITLED2 Summary of this function goes here
%   �ж�һ����Ϣ���ǲ���һ�µ�

granulateresult = granulatedatabyequalrelation( dataset )

granulateresult= distinctcell( granulateresult );

for i=1:length(granulateresult)
   if  length(distinctcell(dataD(granulateresult{i})))>1
       flag=0; %0��ʾ��һ��
       break;
   else
       flag=1; %1��ʾһ��
   end
end

end

