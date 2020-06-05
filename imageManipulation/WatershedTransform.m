function outputImage = WatershedTransform(sourceImage, minima)
%% This function watershed transform target image to enhance cell boundaries
%
% sourceImage:      Target source image to be process
% minima:           
%
% Code source:      https://blogs.mathworks.com/steve/2016/05/09/image-binarization-im2bw-and-graythresh/?s_tid=srchtitle
% Author:           Steve Eddins
% Reference date:   02/29/2020

% Update processing image
image = sourceImage;

% Distance transform target image
DTImage = -bwdist(~image);

% Extended-minima transform DT image to generate a mask according to minima
mask = imextendedmin(DTImage,minima);

% Impose minima the boundary generated form mask
maskedImage = imimposemin(DTImage,mask);

% Compute the watershed transform of processed DT image
Ld2 = watershed(maskedImage);

% Set boundary (pixel == 0) in original image to 0
image(Ld2 == 0) = 0;

% Update output image value
outputImage = image;

end

