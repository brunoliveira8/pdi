function I = gray_mean(RGB)

I = (RGB(:,:,1)+RGB(:,:,2)+RGB(:,:,3))./3;

end

