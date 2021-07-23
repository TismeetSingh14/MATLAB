t = [0:0.00005:0.01];
a = sin(2 * pi * 200 * t);
plot(t,a);
xlabel('time (in seconds)');
title('Signal versus Time');
grid on;