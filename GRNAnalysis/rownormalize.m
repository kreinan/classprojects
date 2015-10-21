function normed = rownormalize(matrix)
normed=zeros(size(matrix,1),size(matrix,2));
for i=1:size(matrix,1)
    normed(i,:)=matrix(i,:)/norm(matrix(i,:));
end
end

