testvec = vals;
noise = randn(5);
noise = noise.*stdev;
testvec = testvec + noise;
scoremat = [];

for i = 1:5
    scoremat(i,:) = score(testvec(i,:),vals,stdev);
end

for j = 1:5
    config(j) = find(scoremat(j,:)==min(scoremat(j,:)));
end

binvec = [1 0 0 0 0; 1 1 0 0 0; 1 1 1 0 0; 1 1 1 1 0; 1 1 1 1 1];

perms1 = unique(perms(binvec(1,:)),'rows');
perms2 = unique(perms(binvec(2,:)),'rows');
perms3 = unique(perms(binvec(3,:)),'rows');
perms4 = unique(perms(binvec(4,:)),'rows');
perms5 = unique(perms(binvec(5,:)),'rows');



