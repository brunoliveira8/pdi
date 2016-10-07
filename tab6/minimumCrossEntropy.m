function BW = minimumCrossEntropy(img)
%retorna uma imagem segmentada usando a limiarização pelo método de renyi

[level I] = minE(img);
BW = im2bw(I,1);

end

