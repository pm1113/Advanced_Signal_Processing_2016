function [y_hat, e, coeffs] = lms(x, z, mu, order)
% x: input signal
% z: reference training signal
% mu: step size, learning rate
% order: estimated order

    % length of input signal
    N = length(x);
    
    % initialising matrix to hold coefficients
    coeffs = zeros(order, N-1);
    
    % initialising vector to hold output of estimated system
    y_hat = zeros(N, 1);
    
    % initialising vector to hold error signal
    e = zeros(N, 1);
    
    % only start estimating once system has sufficient input data
    % 2nd order system will need at least 2 data points to start lms estimation
    for i = order+1:N
        
        % form vector that contains the revelant past samples
        % number of past samples depends on memory in the system
        % which in turn depends on the order of the system
        x_hat = x(i:-1:i-order+1);
        
        % estimate y using the equation W'x
        y_hat(i) = (coeffs(:, i-order).') * x_hat;
        
        % get error vector using e = z - y
        e(i) = z(i) - y_hat(i);
        
        % update the coefficients using
        % W(n+1) = W(n) + mu * e * x(n)
        coeffs(:, i-order+1) = coeffs(:, i-order) + mu * e(i) * x_hat;
        
    end
    
end

