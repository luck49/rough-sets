function [ lowapproximationD ] = lowapproximationofD( dataset,dataD )
%����X���½���
%dataset n*m cell ����������Ե����ݼ�
%dataD n*1 cell  ��ž������Ե����ݼ�

granulateresult = granulatedatabyequalrelation( dataset );

granulateresultD = granulatedatabyequalrelation( dataD );
distinctgranulateresultD = distinctcell( granulateresultD );


lowapproximationD=cell(1);
for i=1:length(distinctgranulateresultD)
    lowapproximationD{1} = [lowapproximationD{1},cell2mat(lowapproximationofX( granulateresult,distinctgranulateresultD{i}))];
end

end

