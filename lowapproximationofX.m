function [ lowapproximation ] = lowapproximationofX( granulateresult,X )
%����X���½���
%granulateresult n*1 cell
lowapproximation=cell(1);
for i=1:length(granulateresult)
   if length(intersect(granulateresult{i},X))==length(granulateresult{i})
       lowapproximation{1}=[lowapproximation{1},i];
   end
end

end

