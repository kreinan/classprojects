newEDS=zeros(size(EDS16data,1),size(EDS16data,2));
for i=1:size(EDS16data,1)
    try
        x=kmeans(EDS16data(i,:),2);
        y=mean(EDS16data(i,x==1));
        z=mean(EDS16data(i,x==2));
        if y>z
            a=1;
        else
            a=2;
        end
        newEDS(i,x==a)=1;
    end
end
clearvars a i x y z;