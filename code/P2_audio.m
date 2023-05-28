clc; clear;

filename1 = '../source_files/audio_in_noise1.wav';
filename2 = '../source_files/audio_in_noise2.wav';
filename3 = '../source_files/audio_in_noise3.wav';

[y1, Fs1] = audioread(filename1);
[y2, Fs2] = audioread(filename2);
[y3, Fs3] = audioread(filename3);

t1 = (length(y1)/Fs1) * 1000;
t2 = (length(y2)/Fs2) * 1000;
t3 = (length(y3)/Fs3) * 1000;

f1 = Fs1*(0:(t1/2))/t1;
f2 = Fs2*(0:(t2/2))/t2;
f3 = Fs3*(0:(t3/2))/t3;

Y1 = fft(y1);
Y2 = fft(y2);
Y3 = fft(y3);

figure
plot(abs(Y1))
figure
plot(abs(Y2))
figure
plot(abs(Y3))
Y1_oneside = Y1(1:length(y1)/2);
f1 = Fs1*(0:length(y1)/2-1)/length(y1);
Y1_meg = abs(Y1_oneside)/(length(y1)/2);

figure
plot(f1, Y1_meg);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('audio\_in\_noise1.wav Frequency Amplitude')


Y2_oneside = Y2(1:length(y2)/2);
f2 = Fs2*(0:length(y2)/2-1)/length(y2);
Y2_meg = abs(Y2_oneside)/(length(y2)/2);

figure
plot(f2, Y2_meg);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('audio\_in\_noise2.wav Frequency Amplitude')

Y3_oneside = Y3(1:length(y3)/2);
f3 = Fs3*(0:length(y3)/2-1)/length(y3);
Y3_meg = abs(Y3_oneside)/(length(y3)/2);

figure
plot(f3, Y3_meg);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('audio\_in\_noise3.wav Frequency Amplitude')

[safD1,idx1] = sort(abs(Y1),'descend'); % Sort in descending order, this makes indexing simpler
[safD2,idx2] = sort(abs(Y2),'descend'); % Sort in descending order, this makes indexing simpler
[safD3,idx3] = sort(abs(Y3),'descend'); % Sort in descending order, this makes indexing simpler

% remove first four sounds
Y1(idx1(1:4),1) = 0;
Y1(idx1(1:4),2) = 0;

% remove first four sounds
Y2(idx2(1:46),1) = 0;
Y2(idx2(1:46),2) = 0;

% remove first six sounds
Y3(idx3(1:6),1) = 0;
Y3(idx3(1:6),2) = 0;

figure
plot(abs(Y1));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('sort\_audio\_in\_noise1.wav Frequency Amplitude')

figure
plot(abs(Y2));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('sort\_audio\_in\_noise2.wav Frequency Amplitude')

figure
plot(abs(Y3));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('sort\_audio\_in\_noise3.wav Frequency Amplitude')

IY1 = ifft(Y1);
IY2 = ifft(Y2);
IY3 = ifft(Y3);

y1 =  bandstop(y1, [498 502], Fs1);
y2 = bandstop(y2, [248 252], Fs1);
y3 = bandstop(y3, [198 202], Fs1);
y3 = bandstop(y3, [798 802], Fs1);

audiowrite("../results/audio/noise_removed1.wav", y1, Fs1);
audiowrite("../results/audio/noise_removed2.wav", y2, Fs2);
audiowrite("../results/audio/noise_removed3.wav", y3, Fs3);

audiowrite("../results/audio/sort_noise_removed1.wav", IY1, Fs1);
audiowrite("../results/audio/sort_noise_removed2.wav", IY2, Fs2);
audiowrite("../results/audio/sort_noise_removed3.wav", IY3, Fs3);