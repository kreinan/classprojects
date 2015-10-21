function sample = samplenetworks(network)
sample=zeros(size(network,1),1);
for i=1:size(network,1)
    sample(i)=ceil(rand*size(network{i},1));
end
end

