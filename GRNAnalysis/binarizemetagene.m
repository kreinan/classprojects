function metamatrix = binarizemetagene(bmatrix,clusters)
metamatrix=zeros(max(clusters),size(bmatrix,2));
for i=1:max(clusters)
    clustersize=length(find(clusters==i));
    for j=1:size(bmatrix,2)
        clustersum=sum(bmatrix(clusters==i,j));
        if clustersum>clustersize/2
            metamatrix(i,j)=1;
        elseif clustersum==clustersize/2
            metamatrix(i,j)=0.5;
        end
    end
end     
end

