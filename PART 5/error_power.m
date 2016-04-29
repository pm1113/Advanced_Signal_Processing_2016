clear all

% load original signal
load vinyl.mat

% load filtered signal
load filtered_signal.mat

% compute left error of filtered signal
error_left = norm(pgm(s2h_original(:,1))-pgm(filtered_left))/norm(pgm(s2h_original(:,1)));

% compute right error of clean signal
error_right = norm(pgm(s2h_original(:,2))-pgm(filtered_right))/norm(pgm(s2h_original(:,2)));


% compute left error of filtered signal
error_noise_left = norm(pgm(s2h_original(:,1))-pgm(s2h(:,1)))/norm(pgm(s2h_original(:,1)));

% compute right error of clean signal
error_noise_right = norm(pgm(s2h_original(:,2))-pgm(s2h(:,2)))/norm(pgm(s2h_original(:,2)));