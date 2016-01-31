%���ߣ�������
function [reduceSet,DM,DMtemp] = discernibilityMatrix( data,d )
%ͨ����־�����ȡԼ��
% data(n,m):cell  ����������Ϣ��
%d(n,1):cell      ��������
%reduceSet(k,1) ÿ��Ԫ��Ϊһ��Լ��


[ilength,jlength]=size(data)
DM=cell(ilength,ilength);

%�����־���
for i=1:ilength
    for j=i:ilength
        attr=[];
        if ~strcmp(d{i},d{j})
            for k=1:jlength
                if ~(strcmp(data{i,k},data{j,k})|| strcmp(data{i,k},'*') || strcmp(data{j,k},'*'))
                    attr=[attr,k];
                end
            end
            DM{i,j}=attr;
            % DM{j,i}=attr;  %Ҫ�����°벿�־���ͽ����
        end
    end
end
%�����־������

%��DM(ilength,ilength)�任�� DMtemp{count}�У�����ȥ��
DMtemp={};
count=0;
for i=1:ilength
    for j=i+1:ilength
        if length(DM{i,j}~=0)
            count=count+1;
            DMtemp{count}=DM{i,j};
        end
    end
end
DMtemp=DMtemp';
DMtemp=distinctcell( DMtemp );
%����

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
%���a || b || c ��a || b ͬʱ���ڣ�ȥ�� a || b || c ����

count=0;
for i=1:length(DMtemp)
    count=count*length(DMtemp{i});
end

resultCell=cell(count,1);

%��ÿ��cellԪ��ȡһ���������
k=0;
command='';
str='';
strend='';
for i=1:length(DMtemp)
    str=strcat(str,'j',int2str(i),',');
    strend=strcat(strend,10,'end');
    if i< length(DMtemp)
        command=strcat(command,'for j',int2str(i),'=',mat2str(DMtemp{i}),10);
    else
        command=strcat(command,10,'for j',int2str(i),'=',mat2str(DMtemp{i}),10,'k=k+1',10,'resultCell{k}=[',str,']',strend)
        eval(command);  %eval�������Խ�һ���ַ���������ִ��
    end
end

for i=1:length(resultCell)
    resultCell{i}= sort(resultCell{i});
end
 reduceSet=resultCell;

end

