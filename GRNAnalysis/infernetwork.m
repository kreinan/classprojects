function network = infernetwork(matrix)
network=cell(size(matrix,1),1);
for i=1:size(matrix,1)
    for j=1:3
        combs=combnk(1:size(matrix,1),j);
        for k=1:size(combs,1)
            f=inferfunction(matrix,i,combs(k,:));
            if ~isempty(f)
                network{i}=[network{i};f];
            end
        end
    end
end
end

