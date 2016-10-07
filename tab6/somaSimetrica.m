%soma simétrica

function grayscale = somaSimetrica(img)
red = img(:,:,1); % Red channel
green = img(:,:,2); % Green channel
blue = img(:,:,3); % Blue channel
red = double(red);
green = double(green);
blue = double(blue);

numerator = red.*green.*blue;
a = ones(size(img, 1), size(img, 2));

denominator = a - red - green - blue + red.*green + red.*blue + green.*blue;
grayscale = (numerator)./(denominator);
grayscale = uint8(grayscale);
end

