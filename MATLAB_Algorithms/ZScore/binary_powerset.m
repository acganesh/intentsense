n = 1:30;
bin = dec2bin(n);
%NumberOfOnes = length(find(bin=='1'));
ones = [];
for i=1:30
    ones(i) = length(find(bin(i,:)=='1'));
end
ones = ones';
ones_sort = sort(ones);
