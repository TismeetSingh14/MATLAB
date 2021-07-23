N = 10000;
n = 0:(N-1);
x = sin(2*pi*n/N);
signal = 0+(100000).*x;
signal_power = rms(signal);
signal_power = signal_power*signal_power;
% sqnr vector will contain the signal to noise ratio
% for each quantization level count
% where L is the number of quantization levels
N = 14;
sqnr = zeros(1, N);
% The levels vector
L = zeros(1,N);
for q_labels = 1:N
    N = numel(signal);
    q_levels = 2^(q_labels);
    % Generating quantization levels
    Vmin = min(signal);
    Vmax = max(signal);
    step_size = (Vmax-Vmin)/q_levels;
    % Creating the steps
    step = zeros(1,q_levels+1);
    for i= 0:q_levels
        step(i+1) = Vmin+i*step_size;
    end
    % calculating the error
    quantization_error = zeros(1, N);
    for i = 1:N
        for j = 2:q_levels+1
            if(step(j-1)<=signal(i) && signal(i)<=step(j))
                quantization_error(i) = signal(i)-((step(j-1)+step(j))/2);
                break;
            end
        end
    end
    % Calculating the quantization noise
    quantization_noise = (rms(quantization_error))^2;
    snr = signal_power/quantization_noise;
    sqnr(q_labels) = snr;
    L(q_labels) = (2^(q_labels));
end
plot(L, sqnr)
xlabel("No. of Quantization Levels");
ylabel("SNR");