fs=100; %sampling frequency
T=10; %width of the rectangule pulse in seconds

t=-10:1/fs:10; %time base

x=rectpuls(t,T); %generating the square wave

plot(t,x,'k');

title(['Rectangular Pulse width=', num2str(T),'s']);
xlabel('Time(s)');
ylabel('Amplitude');
grid on;