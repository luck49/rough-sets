function [ optimalScale ] = select_optimal_scale(data,dataD )
%data={data1 data2 ...}

%��������ʵ����ʾ
%[ optimalScale ] = select_optimal_scale(data2,d2 ) ��1
%[ optimalScale ] = select_optimal_scale(data1,d1 ) ��2

scaleNum=length(data);
objectNum=length(data{1});

%�ж϶�߶����ݼ��Ƿ�һ�¿�ʼ
isconsistence=0;
for i=1:scaleNum
    isconsistence=isconsistence+isconsistenceDataset(data{i}, dataD );
end
if isconsistence==0  %���ÿ���߶ȶ���һ�£���һ�£�����һ��
    isconsistenceflag=0; % 1��ʾ��һ��
else
    isconsistenceflag=1;
end

%�ж϶�߶����ݼ��Ƿ�һ�½���

if isconsistenceflag==1
    %һ�µ���Ϣ��������ķ���ѡ������scale
    display('һ�µ���Ϣ��')
    for i=1:scaleNum
        lowapproximationD  = lowapproximationofD( data{i},dataD );
        if length(lowapproximationD{1})<objectNum
            optimalScale =(i-1);
            break;
        else
            optimalScale=0;  %������Ϣ
        end
    end
else
    %��һ�µ���Ϣ��������ķ���ѡ������scale
    display('��һ�µ���Ϣ��')
    lowapproximationD  = lowapproximationofD( data{1},dataD );
    first = length(lowapproximationD{1});
    for i=2:scaleNum
        lowapproximationD  = lowapproximationofD( data{i},dataD );
        length(lowapproximationD{1});
        if length(lowapproximationD{1})==first
            optimalScale =i;
            break;
        else
            optimalScale=0;
        end
    end
end

end

