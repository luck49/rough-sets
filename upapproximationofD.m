function [ upapproximationD ] = upapproximationofD( dataset,dataD )
%����X���½���
%dataset n*m cell ����������Ե����ݼ�
%dataD n*1 cell  ��ž������Ե����ݼ�

granulateresult = granulatedatabyequalrelation( dataset );

granulateresultD = granulatedatabyequalrelation( dataD );
distinctgranulateresultD = distinctcell( granulateresultD );


upapproximationD=cell(1);
for i=1:length(distinctgranulateresultD)
    upapproximationD{1} = [upapproximationD{1},cell2mat(upapproximationofX( granulateresult,distinctgranulateresultD{i}))];
end

end

