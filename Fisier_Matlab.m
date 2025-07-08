% incarcare fisier audio 
filename = 'trombon.wav';  % Asigură-te că fișierul este în folderul curent

if ~isfile(filename)
    error('Fișierul "%s" nu a fost găsit în directorul curent.', filename);
end

[signal, Fs] = audioread(filename);  % Citim semnalul audio
t = (0:length(signal)-1)/Fs;         % Vector de timp

% Convertim la mono dacă fișierul este stereo
if size(signal, 2) > 1
    signal = mean(signal, 2);
end

% analiza fourier 
N = length(signal);
Y = fft(signal);          
f = (0:N-1)*(Fs/N);       
Y_mag = abs(Y)/N;

% Plot spectrul Fourier
figure;
plot(f(1:floor(N/2)), Y_mag(1:floor(N/2)));
xlabel('Frecvență (Hz)');
ylabel('Amplitudine');
title('Spectrul Fourier al semnalului trombon');
grid on;

% spectograma
window = 1024;    
noverlap = 768;    
nfft = 1024;

figure;
spectrogram(signal, window, noverlap, nfft, Fs, 'yaxis');
title('Spectrograma semnalului trombon');
colorbar;

% reconstructia semnalului si analiza erorii
max_k = 50;               
MSE = zeros(max_k, 1);   

for k = 1:max_k
    Y_k = zeros(size(Y));
    Y_k(1:k+1) = Y(1:k+1);           
    Y_k(end-k+1:end) = Y(end-k+1:end); 
    signal_k = real(ifft(Y_k));       
    MSE(k) = mean((signal - signal_k).^2); 
end

figure;
plot(1:max_k, MSE, '-o');
xlabel('Număr de armonici');
ylabel('Eroare pătratică medie (MSE)');
title('Evoluția erorii de reconstrucție Fourier');
grid on;

disp('Analiza Fourier a fost realizată cu succes!');