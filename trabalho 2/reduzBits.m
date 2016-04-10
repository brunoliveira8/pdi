function [ A B ] = reduzBits ( bits, imageToConvert )
    if(bits > 0 && bits < 8)
        disp('Valor na faixa!');
        [A,B] = gray2ind(imageToConvert, (2^bits));
    else
        disp('Valor não está na faixa!');
    end
end

% http://dsp.stackexchange.com/questions/21835/quantization-image-using-matlab