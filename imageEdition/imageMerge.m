function image = imageMerge(imagePieces)
%% Merge input image pieces into picture
%
% image => target image piece

% Calculate unit height & width
unitHeight = size(imagePieces, 1);
unitWidth = size(imagePieces, 2);

% Calculate number of rows & number of columns
numberOfRow = size(imagePieces, 3);
numberOfColumn = size(imagePieces, 4);

for rowIndex = 0:numberOfRow - 1
    startHeight = rowIndex * unitHeight + 1;
    endHeight = startHeight + unitHeight - 1;
    for columnIndex = 0:numberOfColumn - 1
        startWidth = columnIndex * unitWidth + 1;
        endWidth = startWidth + unitWidth - 1;
        
        image(startHeight:endHeight, startWidth:endWidth) = imagePieces(:,:,rowIndex + 1,columnIndex + 1);
    end
end

end

