function n = countnetworks(mynetwork)
n=1;
for i=1:size(mynetwork,1)
    if size(mynetwork{i},1)>0
        n=n*size(mynetwork{i},1);
    end
end
end

