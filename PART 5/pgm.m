function Pf= pgm(x)
    N = length(x);
    xdft = fft(x);
    Pf = (1/N).*(abs(xdft).^2);
end
