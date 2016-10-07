function BW = otsu(img)
level = graythresh(img);
BW = im2bw(img,level);

end