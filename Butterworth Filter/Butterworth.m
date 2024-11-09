% Read the noisy speech signal
[s, Fs] = audioread('noisy.wav');

% Define the cutoff frequency and order of the Butterworth filter
cutoff_frequency = 2000; % Adjust this value based on the frequency content of the noise and speech
order = 4; % Adjust this value based on the desired roll-off characteristics

% Design the Butterworth low-pass filter
[b, a] = butter(order, cutoff_frequency/(Fs/2), 'low');

% Apply the filter to the noisy signal
filtered_signal = filter(b, a, s);

% Save the filtered signal as an audio file
audiowrite('filtered_output_butterworth.wav', filtered_signal, Fs);

% Plot the original and filtered signals for comparison
t = (0:length(s)-1) / Fs;
figure;
subplot(2,1,1);
plot(t, s);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Noisy Signal');
subplot(2,1,2);
plot(t, filtered_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered Signal');
