function Px = pgm(x)

    % length of input sequence
    N = length(x);
    
    % calculate the discrete fourier transform of the sequence 
    xdft = fft(x);
    
    % calculate the PSD of the seqeunce
    Px = (1/N).*(abs(xdft).^2);
    
end
