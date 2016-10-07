function img_out = seg_kmeans(img_in,num_cluster)

img_in = mat2gray(img_in);
[line,column] = size(img_in);
img_line = img_in(:);

[idx,C] = kmeans(img_line,num_cluster,'Distance','sqeuclidean');

img_out = ones(line,column,num_cluster);
for k = 1:num_cluster
    count = 1;
    for i = 1:column
        for j = 1:line
            if(idx(count) == k)
                img_out(j,i,k) = img_line(count);
            end;
            count = count+1;                     
        end;
    end;
end;