
function grayscale = rgb2grayMean(img)
red = img(:,:,1); % Red channel
green = img(:,:,2); % Green channel
blue = img(:,:,3); % Blue channel

red = double(red);
blue = double(blue);
green = double(green);

mat = red + green + blue;
mat = mat.*1/3;

grayscale = uint8(mat);

end
