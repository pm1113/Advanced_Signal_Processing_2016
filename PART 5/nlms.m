function [y, e, estimated_coeffs, mu] = nlms(x, z, initial_mu, order)
% x: input white noise
% z: output of unknown system
% mu: step size
% order: order of unknown system

    % length of data
    N = length(x);
    
    % initialising matrix to hold coefficients
    estimated_coeffs = zeros(order, N-1);
    
    % initialising vector to hold output of identified system
    y = zeros(N, 1);
    
    % initialising vector to hold error signal
    e = zeros(N, 1);
    
    % initialising vector to hold step size
    mu = initial_mu;
    
    % only start estimating once it has enough input data
    % 2nd order system will need at least 2 data points to start lms estimation
    for i = order+1:N
        
        % form vector that contains the revelant past samples
        x_hat = x(i:-1:i-order+1);
        
        % estimate y using the equation W'x
        y(i) = (estimated_coeffs(:, i-order).')*x_hat;
        
        % get error vector using e = z - y
        e(i) = z(i) - y(i);
        
        % noramlised least mean square
        mu = initial_mu /(x_hat'*x_hat+1e-6);
        
        % update the coefficients using
        % W(n+1) = W(n) + mu * e * x(n)        
        estimated_coeffs(:,i-order+1) = estimated_coeffs(:, i-order) + mu*e(i)*x_hat;
        

    end
    
end

