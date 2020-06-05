function outputImage = opening(sourceImage, SE, erosionTime, dilationTime)
%% This function with open the overall image to erase pieces pixels
%
% sourceImage:  Source image to be processed
% SE:           Structuring element
% processTime:  The number of dilation and erosion

outputImage = sourceImage;

%% Erosion process for processTime times
for index = 1:erosionTime   
    outputImage = imerode(outputImage, SE);
end

%% Dilation process for processTime times
for index = 1:dilationTime  
    outputImage = imdilate(outputImage, SE);
end

end

