usepatlist = {'waterbottle','keys','wallet','toothbrush','unscrewing'}
success = [0 0 0 0 0];
total = [0 0 0 0 0];

binvec = [1 0 0 0 0; 1 1 0 0 0; 1 1 1 0 0; 1 1 1 1 0; 1 1 1 1 1];

perms1 = unique(perms(binvec(1,:)),'rows');
perms2 = unique(perms(binvec(2,:)),'rows');
perms3 = unique(perms(binvec(3,:)),'rows');
perms4 = unique(perms(binvec(4,:)),'rows');
perms5 = unique(perms(binvec(5,:)),'rows');

l1 = size(perms1);
l2 = size(perms2);
l3 = size(perms3);
l4 = size(perms4);
l5 = size(perms5);
class_setup;
load prereq_data;

n = 1
while(n <= 100)
    testvec = vals;
    noise = randn(5);
    noise = noise.*stdev;
    testvec = testvec + noise;
    
    linclass2 = ClassificationTree.fit(data,usepat,'SplitCriterion','twoing');
    for j = 1:5
        if(strcmp(predict(linclass2, testvec(j,:)),usepatlist{j}) == 1)
            success(5) = success(5) + 1;
        end
        total(5) = total(5) + 1;
    end
    
    for i = 1:l1(1)
        [data2, testvec2] = subset(perms1(i,:), data, testvec);
        linclass2 = ClassificationTree.fit(data2,usepat,'SplitCriterion','twoing');
        for j = 1:5
            if(strcmp(predict(linclass2, testvec2(j,:)),usepatlist{j}) == 1)
                success(1) = success(1) + 1;
            end
            total(1) = total(1) + 1;
        end
    end
    
    for i = 1:l2(1)
        [data2, testvec2] = subset(perms2(i,:), data, testvec);
        linclass2 = ClassificationTree.fit(data2,usepat,'SplitCriterion','twoing');
        for j = 1:5
            if(strcmp(predict(linclass2, testvec2(j,:)),usepatlist{j}) == 1)
                success(2) = success(2) + 1;
            end
            total(2) = total(2) + 1;
        end
    end
    
    for i = 1:l3(1)
        [data2, testvec2] = subset(perms3(i,:), data, testvec);
        linclass2 = ClassificationTree.fit(data2,usepat,'SplitCriterion','twoing');
        for j = 1:5
            if(strcmp(predict(linclass2, testvec2(j,:)),usepatlist{j}) == 1)
                success(3) = success(3) + 1;
            end
            total(3) = total(3) + 1;
        end
    end
    
    for i = 1:l4(1)
        [data2, testvec2] = subset(perms4(i,:), data, testvec);
        linclass2 = ClassificationTree.fit(data2,usepat,'SplitCriterion','twoing');
        for j = 1:5
            if(strcmp(predict(linclass2, testvec2(j,:)),usepatlist{j}) == 1)
                success(4) = success(4) + 1;
            end
            total(4) = total(4) + 1;
        end
    end
    n = n + 1
end