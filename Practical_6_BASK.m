signal_count = 1000000;
original_signal = randi([0, 1], 1, signal_count);
sent_signal = original_signal;
for i = 1:signal_count
    if (original_signal(i) == 0)
        sent_signal(i) = 0;
    else
        sent_signal(i) = 1;
    end
end

ber_simulated = [];
ber_theoretical = [];
for EbN0Db = 1:15
    EbN0 = 10 ^ (EbN0Db / 10);
    var_error = sqrt(1 / (2 * EbN0));
    received_signal = sent_signal + var_error .* randn(1, signal_count);
    received_signal = (received_signal > 0.5);
    bits_changed = sum(received_signal ~= original_signal);
    simulated_error = bits_changed / signal_count;
    ber_simulated = [ber_simulated simulated_error];
    theoretical_error = 0.5 * erfc(sqrt(EbN0/4));
    ber_theoretical = [ber_theoretical theoretical_error];
end
EbN0Db = 1:15;
semilogy(EbN0Db, ber_theoretical, '-go', EbN0Db, ber_simulated, '-r*');
disp(ber_simulated);
xlabel('Eb/N0(dB)');
ylabel('BER');
legend('Theory(erfc)','Simulation');