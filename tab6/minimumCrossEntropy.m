function BW = minimumCrossEntropy(img)
%retorna uma imagem segmentada usando a limiariza��o pelo m�todo de renyi

[level I] = minE(img);
BW = im2bw(I,1);

end

