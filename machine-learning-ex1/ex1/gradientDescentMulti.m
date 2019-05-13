function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
    temp = zeros(size(X,2),1)
    ans1 = zeros(size(X,1),1);
  

    temp = zeros(size(theta,1), 1);
    for itr = 1:size(theta,1)
        ans1 = (((X * theta) - y) .* X(:,itr));
        n = sum(ans1(:));
        temp(itr) = theta(itr) - (alpha/m) * n
    end
    theta = temp
    disp("theta")
    disp(theta);

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);
    %disp (J_history)

end

end
