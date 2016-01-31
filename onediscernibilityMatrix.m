%���ߣ�������
function [rule] = onediscernibilityMatrix( data,d,bujicurrentdgranule )
%ͨ����־�����ȡԼ��
% data(n,m):cell  ����������Ϣ��
%d:int      ��ǰ����Ķ����±�
%bujicurrentdgranule �����������ɵĵȼ��࣬��ǰԪ�صȼ���Ĳ���


[ilength,jlength]=size(data);

bujicurrentdgranulelength=length(bujicurrentdgranule);
DM=cell(bujicurrentdgranulelength,1);

%�����־���

for i=1:bujicurrentdgranulelength
    attr=[];
    for k=1:jlength
        if ~(strcmp(data{bujicurrentdgranule(i),k},data{d,k})|| strcmp(data{bujicurrentdgranule(i),k},'*') || strcmp(data{d,k},'*'))
            attr=[attr,k];
        end
    end
    DM{i}=attr;
end
DMtemp=distinctcell( DM );
%�����־������

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
    resultCell{i}=unique(resultCell{i});
    resultCell{i}= sort(resultCell{i});
end

%���a&b&c | a&b ͬʱ���ڣ�ȥ�� a&b&c
i=1;
while i<=length(resultCell)
    j=1;
    while j<=length(resultCell)
        if i~=j
            if length(intersect(resultCell{i},resultCell{j}))==length(resultCell{i})
                resultCell(j)=[];
            elseif length(intersect(resultCell{i},resultCell{j}))==length(resultCell{j})
                resultCell(i)=[];
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

%���a&b&c | a&b ͬʱ���ڣ�ȥ�� a&b

rule=resultCell;

end

