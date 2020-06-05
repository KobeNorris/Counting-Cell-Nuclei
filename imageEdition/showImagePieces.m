function showImagePieces(imagePieces)
%% Demonstrate all image pieces
%
% imagePieces => target image pieces

% Calculate number of rows & number of columns
numberOfRow = size(imagePieces, 3);
numberOfColumn = size(imagePieces, 4);

% Initialize image index
imageIndex = 0;

figure;
for rowIndex = 0:numberOfRow - 1
    for columnIndex = 0:numberOfColumn - 1
        imageIndex = imageIndex + 1;
        subplot(numberOfRow, numberOfColumn ,imageIndex);
        imshow(imagePieces(:,:,rowIndex + 1,columnIndex + 1));
    end
end

end

