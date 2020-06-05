function imagePieces = imageCut(image,height,width)
%% Cut input image into picture pieces of input size
%
% image => target image
% height => height of each image piece
% width => width of each image piece

% Calculate unit height & width
imageHeight = size(image, 1);
imageWidth = size(image, 2);

% Calculate number of rows & number of columns
numberOfRows = ceil(imageHeight / height);
numberOfColumns = ceil(imageWidth / width);

% Convert image into uniformed size
image_processed = uint8(zeros(numberOfRows * height, numberOfColumns * width));
image_processed(1:imageHeight, 1:imageWidth) = image(:,:);

% Pre-allocating memory space
imagePieces = uint8(zeros(height, width, numberOfRows, numberOfColumns));

for rowIndex = 0:numberOfRows - 1
    startHeight = rowIndex * height + 1;
    endHeight = startHeight + height - 1;
    for columnIndex = 0:numberOfColumns - 1
        startWidth = columnIndex * width + 1;
        endWidth = startWidth + width - 1;
        
        imagePieces(: , : , rowIndex + 1, columnIndex + 1) = image_processed(startHeight:endHeight, startWidth:endWidth);
    end
end

end