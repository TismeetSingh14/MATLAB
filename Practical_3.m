mean = 3;
var = 1;
N = 100000;
x = mean + sqrt(var)*randn(1,N);
no_of_bins = 100;
a = min(x);
b = max(x);
k = linspace(a,b,no_of_bins);
count(size(k))=0;
y(no_of_bins) = 0;
for i= 1:length(k)-1
    for j = 1:length(x)
        if x(j) >= k(i) && x(j) < k(i + 1)
            count(i) = count(i) + 1;
        end
    end
    y(i) = (k(i) + k(i + 1))/2;
end
subplot(211);
bar(y(1:end-1),count(1:end-1)/length(x));
subplot(212);
histogram(x);