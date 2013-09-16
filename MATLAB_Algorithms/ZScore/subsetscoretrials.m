scoremat = [];
scoremat1 = {};
scoremat2 = {};
scoremat3 = {};
scoremat4 = {};

configmat = [];
configmat1 = {};
configmat2 = {};
configmat3 = {};
configmat4 = {};

scoremattemp = [];

success = [0 0 0 0 0];
total = [0 0 0 0 0];


binvec = [1 0 0 0 0; 1 1 0 0 0; 1 1 1 0 0; 1 1 1 1 0; 1 1 1 1 1];

perms1 = unique(perms(binvec(1,:)),'rows');
perms2 = unique(perms(binvec(2,:)),'rows');
perms3 = unique(perms(binvec(3,:)),'rows');
perms4 = unique(perms(binvec(4,:)),'rows');
perms5 = unique(perms(binvec(5,:)),'rows');

n=1;
while(n<=10)
    testvec = vals;
    noise = randn(5);
    noise = noise.*stdev;
    testvec = testvec + noise;
    
    
    for i = 1:5
        scoremat(i,:,n) = score(testvec(i,:),vals,stdev,binvec(5,:));
    end
    
    configmat(1,:,n) = cfg(scoremat(:,:,n));
    
    for k = 1:5
        if k == configmat(1,k,n)
            success(1) = success(1)+1;
        end
        total(1) = total(1)+1;
    end
    
    for j = 1:5
        for i = 1:5
            scoremattemp(i,:) = score(testvec(i,:),vals,stdev,perms1(j,:));
        end
        configmattemp = cfg(scoremattemp);
        configmat1{1,j,n} = configmattemp;
        scoremat1{1,j,n} = scoremattemp;
    end
    
    for k = 1:5
        tempconfig = configmat1{1,k,n};
        for h = 1:5
            if h == tempconfig(1,h)
                success(2) = success(2)+1;
            end
            total(2) = total(2) + 1;
        end
    end
    
    for j = 1:10
        for i = 1:5
            scoremattemp(i,:) = score(testvec(i,:),vals,stdev,perms2(j,:));
        end
        configmattemp = cfg(scoremattemp);
        configmat2{1,j,n} = configmattemp;
        scoremat2{1,j,n} = scoremattemp;
    end
    
    for k = 1:10
        tempconfig = configmat2{1,k,n};
        for h = 1:5
            if h == tempconfig(1,h)
                success(3) = success(3)+1;
            end
            total(3) = total(3) + 1;
        end
    end
    
    
    for j = 1:10
        for i = 1:5
            scoremattemp(i,:) = score(testvec(i,:),vals,stdev,perms3(j,:));
        end
        configmattemp = cfg(scoremattemp);
        configmat3{1,j,n} = configmattemp;
        scoremat3{1,j,n} = scoremattemp;
    end
    
    for k = 1:10
        tempconfig = configmat3{1,k,n};
        for h = 1:5
            if h == tempconfig(1,h)
                success(4) = success(4)+1;
            end
            total(4) = total(4) + 1;
        end
    end
    
    for j = 1:5
        for i = 1:5
            scoremattemp(i,:) = score(testvec(i,:),vals,stdev,perms4(j,:));
        end
        configmattemp = cfg(scoremattemp);
        configmat4{1,j,n} = configmattemp;
        scoremat4{1,j,n} = scoremattemp;
    end
    
    for k = 1:5
        tempconfig = configmat4{1,k,n};
        for h = 1:5
            if h == tempconfig(1,h)
                success(5) = success(5)+1;
            end
            total(5) = total(5) + 1;
        end
    end
    
    n = n+1;
end



