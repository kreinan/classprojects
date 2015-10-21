function trimmed = trimregulators(network)
trimmed=cell(size(network,1),1);
for i=1:size(network,1) %loop through nodes
    for j=1:size(network{i},1) %loop through list of activators/inhibitors
        regulators=network{i}{j,1};
        if ~isempty(trimmed{i,1})
            if ~isempty(regulators)
                subsetexists=0;
                for k=1:size(trimmed{i},1)
                    if all(ismember(trimmed{i}{k,1},regulators))
                        subsetexists=1;
                        break
                    end
                end
                if subsetexists==0
                    trimmed{i}=[trimmed{i};network{i}(j,:)];
                end
            end
        else
            trimmed{i}=network{i}(j,:);
        end
    end
end     
end

