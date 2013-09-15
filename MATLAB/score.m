function [ scorevec ] = score( v, vals, stdev, active) %Active: the binary permutation for taking subsets
for i=1:5
    diff(i,:) = v - vals(i,:);
end

for j=1:5
    if (active(j) == 0)
        diff(:,j) = 0;
    end
end

norm_diff = abs(diff./stdev); %Z-Score matrix
scorevec = sum(norm_diff');
end

