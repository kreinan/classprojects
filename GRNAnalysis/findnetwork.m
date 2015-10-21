function mynetworks = findnetwork(network,initial,terminal,T,matrix)
mynetworks=cell(length(initial),0);
for i=1:100000
    sample=samplenetworks(network);
    h=runnetwork(initial,network,sample,T);
    howmatch=sum(sum(h==matrix));
    if howmatch>=286
        newnetwork=cell(length(initial),1);
        for j=1:length(initial)
            newnetwork{j}=network{j}(sample(j),:);
        end
        mynetworks=[mynetworks,newnetwork];
    end
end
end

