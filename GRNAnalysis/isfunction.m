function bool = isfunction(matrix,node,activators,inhibitors)
bool=0;
for i=1:size(matrix,2)-1
    if or(prod(matrix(inhibitors,i))==1,prod(matrix(activators,i))==1)
        if (1-prod(matrix(inhibitors,i)))*prod(matrix(activators,i))~=matrix(node,i+1)
            %not a function
            bool=0;
            break
        else
            bool=1;
        end
    end
end
end

