function ics = bestk(matrix)
ics=zeros(25,1);
for i=4:4:100
    try
        ics(i/4)=consistency(matrix,i);
    catch
        ics(i/4)=0;
    end
end
plot(ics);
end

