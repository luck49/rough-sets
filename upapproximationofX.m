function [ upapproximation ] = upapproximationofX( granulateresult,X )
%����X���½���
%granulateresult n*1 cell
upapproximation=cell(1);
for i=1:length(granulateresult)
   if length(intersect(granulateresult{i},X)>0)
       upapproximation{1}=[upapproximation{1},i];
   end
end

end



