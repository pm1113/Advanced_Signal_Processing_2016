function [y, e,estimated_coeffs mu] = lms_gs(x, z, initial_mu, rho, order)
% x: input signal
% z: reference training signal
% initial_mu: initial step size, learning rate
% rho: step size of adapative step size equation
% order: estimated order

    % length of input signal
    N = length(x);
    
    % initialising matrix to hold coefficients
    estimated_coeffs = zeros(order, N);
    
    % initialising vector to hold output of identified system
    y = zeros(N, 1);
    
    % initialising vector to hold error signal
    e = zeros(N, 1);
    
    % initialising vector to hold step size
    mu = ones(N, 1) * initial_mu;
    
    % only start estimating once it has enough input data
    % 2nd order system will need at least 2 data points to start lms estimation
    for i = order+1:N
        
        % form vector that contains the revelant past samples
        % number of past samples depends on memory in the system
        % which in turn depends on the order of the system
        x_hat = x(i:-1:i-order+1);
        
        % estimate y using the equation W'x
        y(i) = (estimated_coeffs(:, i-order).')*x_hat;
        
        % get error vector using e = z - y
        e(i) = z(i) - y(i);
        
        % update the coefficients using
        % W(n+1) = W(n) + mu * e * x(n)        
        estimated_coeffs(:,i-order+1) = estimated_coeffs(:, i-order) + mu(i)*e(i)*x_hat;
        
        % update mu using matthews and xie equation
        mu(i+1) = mu(i) + rho * e(i) * e(i) * x_hat' * x(i-1:-1:i-order) ; 

    end
    
end

