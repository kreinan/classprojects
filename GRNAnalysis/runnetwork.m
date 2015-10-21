function sim = runnetwork(initial,network,samples,T)
nextstate=initial;
sim=zeros(length(initial),T+1);
sim(:,1)=initial;
for i=1:T
    for j=1:length(nextstate)
        if samples(j)>0
            if isempty(network{j}{samples(j),3})
                inhibitors=0;
            else
                inhibitors=prod(initial(network{j}{samples(j),3}));
            end
            if inhibitors==1
                nextstate(j)=0;
            else
                if isempty(network{j}{samples(j),2})
                    activators=0;
                else
                    activators=prod(initial(network{j}{samples(j),2}));
                end
                if activators==1
                    nextstate(j)=1;
                end
            end
        end
    end
    sim(:,i+1)=nextstate;
    initial=nextstate;
end
end

