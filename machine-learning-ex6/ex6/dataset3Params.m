function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
vals = [0.01 0.03 0.1 0.3 1 1.3 10 30];

error_final = 10.0;

for c = vals
  for Sigma = vals
    
    %Train the model using the training examples with a particular sigma and c
    model= svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, Sigma));
    %for every sigma and c, predict the value
    predictions = svmPredict (model, Xval);
    
    %calculate the error for the prediction
    error_present = mean(double(predictions ~= yval));
    
    %find the sigma and C with a lower error 
    if (error_present < error_final)
      C = c;
      sigma = Sigma;
      error_final = error_present;
    endif
  endfor
endfor






% =========================================================================

end
