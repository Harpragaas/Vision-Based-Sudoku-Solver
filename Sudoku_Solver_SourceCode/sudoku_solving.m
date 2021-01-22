function [solution, sol] = sudoku_solving(Sudoku)
%This function used to solve sudoku by constraint planning method
%This function was inspired by https://yalmip.github.io/example/
%input:    S           9x9 sudoku matrix
%output:   solution    9x9 sudoku result matrix
%          sol         binary result, 1 for yes this sudoku has a result

%the dimension of sudoku, 3x3
poi = 3;
%build a 3-D matrix to store information of sudoku
binModel = binvar(poi^2,poi^2,poi^2,'full');

%constraint 1, each number can only appear once in each row
constraints = [sum(binModel,1) == 1];
%constraint 2, each number can only appear once in each column
constraints = [constraints, sum(binModel,2) == 1];
%constraint 3, each position can only has one number
constraints = [constraints, sum(binModel,3) == 1];


%constraint 4, the init digits can not change
for i = 1:poi^2
    for j = 1:poi^2
        if Sudoku(i,j)
            constraints = [constraints, binModel(i,j,Sudoku(i,j)) == 1];
        end
    end
end

%constraint 5, each number can only appear once in each 3x3 zone 
for m = 1:poi
    for n = 1:poi
        for k = 1:poi^2
            s = sum(sum(binModel((m-1)*poi+(1:poi),(n-1)*poi+(1:poi),k)));
            constraints = [constraints, s == 1];
        end
    end
end

%solving this constraint planning problem
sol = solvesdp(constraints);
%get the binary result
sol = sol.problem;

solution = 0;
%get 9x9 result from the 3-D matrix and turun it into double
for i = 1:poi^2
      solution = solution  + i*double(binModel(:,:,i));
end