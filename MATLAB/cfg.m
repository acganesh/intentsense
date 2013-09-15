function [ config ] = cfg( sm ) %sm = score matrix

for j = 1:5
    config(j) = find(sm(j,:)==min(sm(j,:)));
end

end

