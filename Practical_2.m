lower_limit = 2;
upper_limit = 3;
N = 1000000;
no_of_bins = 20;
x = lower_limit + (upper_limit - lower_limit).*rand(1,N);
k = linspace(lower_limit, upper_limit, no_of_bins);
count(size(k)) = 0;
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
p = [mean(x) std(x) var(x)]