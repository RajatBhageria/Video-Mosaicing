% File name: corner_detector.m
% Author: Kashish Gupta and Rajat Bhageria
% Date created: 11/7/17

function [cimg] = corner_detector(img)
% Input:
% img is an image

% Output:
% cimg is a corner matrix

%convert the image to grayscale if the input is not
if size(img, 3) == 3
    img = rgb2gray(img);
end

%find the Harris features 
points = detectHarrisFeatures(img); 
%points1 = cornermetric(img);

%create a new return image with initial values of zero 
cimg = zeros(size(img)); 

%find the coordinates of all the corners 
coordinates = round(points.Location);

%find the values of the corners 
strength = points.Metric; 

%put the strengths into the new image 
ind = sub2ind(size(cimg),coordinates(:,2),coordinates(:,1));
cimg(ind) = strength(:);


%points1(points1<0) = 0;
%sortt = sort(points1(:));
%sixth = sortt(size(sortt, 1)*0.94);
%points1(points1<sixth) = 0;
%cimg = points1;

end