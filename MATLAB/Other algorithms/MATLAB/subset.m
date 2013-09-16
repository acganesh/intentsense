function [ subdata, subtestvec ] = subset( perm, data, testvec )
y = [1 1 1 1 1];
for i = 1:5
    if perm(i) == 0
        perm(i) = i;
        y(i) = 0;
    end
end
perm(perm==1 & y==1) = [];
subdata = data;
subtestvec = testvec;
subdata(:,perm) = [];
subtestvec(:,perm) = [];

% while(i<=s(2))
%     if perm(i) == 0
%         subdata(:,i) = [];
%         subtestvec(:,i) = [];
%     end
%     s = size(subdata);
%     i=i+1;
% end

end
