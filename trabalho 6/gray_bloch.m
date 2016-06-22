function I = gray_bloch(RGB)

I = (RGB(:,:,1)+RGB(:,:,2)+RGB(:,:,3))./3;

aux = ones(size(RGB(:,:,1)));

I = (RGB(:,:,1).*RGB(:,:,2).*RGB(:,:,3)) ...
./(aux - RGB(:,:,1) - RGB(:,:,2) - RGB(:,:,3) ... 
    + RGB(:,:,1).*RGB(:,:,2)+RGB(:,:,1).*RGB(:,:,3)+RGB(:,:,2).*RGB(:,:,3));

end

