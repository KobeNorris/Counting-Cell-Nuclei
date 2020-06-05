addpath .\imageEdition
addpath .\imageManipulation

%% Environment configuration
configure;

for imageIndex = 1:size(PictureNameCollection,2)
    %% Generate file path towards the image
    filePath = sprintf("%s%s",baseFilePath,PictureNameCollection(imageIndex));
    sourceImage = imread(filePath);
    
    B = sourceImage(:,:,3);
    
    %% Colour space conversion
    greenness = sourceImage(:,:,2);
    
    %% Noise reduction
    greenness = medfilt2 (greenness, medianFilterSize);
    
    %% Thresholding
    obj = imagePieceCollection(greenness,imagePieceHeight,imagePieceWidth);
    obj = ThresholdProcess(obj);
    image = getImage(obj);
    
    %% Segmentation
    image = WatershedTransform(image, minima);
    
    %% Morphological image process
    SE = strel('disk', 1);
    image = opening(image, SE, erosionTime, dilationTime);
    
    %% Quantitative data export
    [L,number] = bwlabel(image);
    
    %% Generate cell number information towards current image
    info = sprintf('Cell number: %d',number);
    
    %% Demonstrate cell number information and the processed image
    figure;
    subplot(2,1,1);
    imshow(sourceImage);
    title(PictureNameCollection(imageIndex));
    subplot(2,1,2);
    imshow(image);
    title(info);
    
end