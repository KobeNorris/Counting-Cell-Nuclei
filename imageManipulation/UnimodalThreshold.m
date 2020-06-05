%% Unimodal thresholding
% This is a self implemented unimodal threshold
function threshold = UnimodalThreshold(image)

% Conver target image into histogram
hist_img = imhist(image);

%% Find the peak point of the histogram
[peakValue, peakPosition] = max(hist_img);
peak = [peakPosition, peakValue];

%% Find the foot point of the histogram
ind_nonZero = find(hist_img>0);
last_zeroBin = ind_nonZero(end);

%% Threshold calculating
foot = [last_zeroBin, hist_img(last_zeroBin)];
best_idx = -1;
max_dist = -1;
for x0 = peakPosition:last_zeroBin
    y0 = hist_img(x0);
    a = peak - foot;
    b = [x0,y0] - foot;
    cross_ab = a(1)*b(2)-b(1)*a(2);
    d = norm(cross_ab)/norm(a);
    if(d>max_dist)
        best_idx = x0;
        max_dist = d;
    end
end

threshold = best_idx/255;

end