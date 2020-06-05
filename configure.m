%% Souce image setting

% Basic file path
baseFilePath = "./imageSource/";

% Name of all images
PictureNameCollection = ["StackNinja1.bmp","StackNinja2.bmp","StackNinja3.bmp"];

%% Parameter configuration

% Target height of image piece (pixel)
imagePieceHeight = 32;

% Target width of image piece (pixel)
imagePieceWidth = 128;

% The minima of watershed transform process
minima = 0.4;

% Size of median filter window
medianFilterSize = [3 3];

% Number of erosion for morphological operator
erosionTime = 3;

% Number of dilation for morphological operator
dilationTime = 3;