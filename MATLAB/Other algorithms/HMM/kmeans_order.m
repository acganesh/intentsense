idx_m2 = idx_m;
for i=1:306
    if idx_m(i) == 1
        idx_m2(i) = 1;
    elseif idx_m(i) == 2
        idx_m2(i) = 2;
    elseif idx_m(i) == 5
        idx_m2(i) = 3;
    elseif idx_m(i) == 4
        idx_m2(i) = 4;
    elseif idx_m(i) == 3
        idx_m2(i) = 5;
    end
end