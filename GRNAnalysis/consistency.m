function cons = consistency(matrix,k)
a=kmeans(matrix,k);
total=0;
for i=1:k
    [U,S,V] = svd(matrix(a==i,:));
    total=total+S(1,1)/S(2,2);
end
cons=total/k;
end

