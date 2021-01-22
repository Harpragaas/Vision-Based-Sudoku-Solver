function puzzle_val = KNN_recognition(cropped_image) %28*28*1*81
%input: the cropped_image with 81 digits ready to be recognized
%output: recoginiztion result, combining them all as the puzzle
%This function is to recognize the digits by using k-nearest neighbours
load('data.mat','data'); %load data
train_X = data.trnX;
train_Y = data.trnY;

test_X = reshape(cropped_image,[784,81]); %reshape 28*28*1*81 to 784*1, same
%with training image size

test_number = size(test_X, 2); %define the number of test image, actually it is 81

puzzle_val = zeros(1, test_number); %set tge puzzel as all 0 initially
for i = 1:test_number
    temp = test_X(:,i) - train_X;
    distance = sum(temp.^2, 1); %compute the Eculidien distance between the test
    %image and each training image
    [~, index] = sort(distance); %use sort function to find the smallest distance
    puzzle_val(i) = mode(train_Y(index(1:3))); %assign the label to each test image
    
end
puzzle_val = reshape(puzzle_val,9,9); %convert to a standard 9*9 puzzle
puzzle_val = puzzle_val' ;


end