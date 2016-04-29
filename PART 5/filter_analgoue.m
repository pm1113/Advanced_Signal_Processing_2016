clear all;
Wn=[0.067 0.07]
% design Chebyshev Type I bandstop filter
% [b,a] = cheby1(3, 0.4, [0.067 0.07], 'stop');
% freqz(b,a)



[b,a] = butter(,[0.067 0.07],'stop');
freqz(b,a)
dataIn = randn(1000,1);
dataOut = filter(b,a,dataIn);