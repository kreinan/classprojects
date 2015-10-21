function [t,allstates] = attractor(network,initial)
allstates=initial;
t=inf;
for i=1:100
    nextstate=initial;
    for j=1:length(initial)
        if isempty(network{j}{3})
            inhibitors=0;
        else
            inhibitors=prod(initial(network{j}{3}));
        end
        if inhibitors==1
            nextstate(j)=0;
        else
            if isempty(network{j}{2})
                activators=0;
            else
                activators=prod(initial(network{j}{2}));
            end
            if activators==1
                nextstate(j)=1;
            end
        end
    end
    for k=1:size(allstates,2)
        if allstates(:,k)==nextstate
            t=i;
        end
    end
    allstates=[allstates,nextstate];
    if t~=inf
        break
    end
end
end

