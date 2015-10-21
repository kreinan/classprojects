function f = inferfunction(matrix,target,regulators)
f={};
for i=0:length(regulators)
    combs=combnk(regulators,i);
    for j=1:size(combs,1)
        if isfunction(matrix,target,combs(j,:),setdiff(regulators,combs(j,:)))==1
            f={regulators,combs(j,:),setdiff(regulators,combs(j,:))};
            break
        end
    end
    if ~isempty(f)
        break
    end
end
end

