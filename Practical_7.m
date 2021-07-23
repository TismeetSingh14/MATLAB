G = [1 1 0 0 1 0 1; 0 1 1 1 1 0 0; 1 1 1 0 0 1 1];
n = 7;
k = 3;
no_of_codewords = 2^k;
decimals = (0: no_of_codewords - 1)';
messages = de2bi(decimals, 'left-msb');
codewordVectors = messages*G;
decimalMessages = [decimals messages]
codeword = mod(codewordVectors,2)
disp("No of Codewords = " + no_of_codewords);
disp("Coderate(k/n) = " + k/n);

Gnew = mod(rref(G),2)
P = Gnew(:,k+1:n);
Pt = transpose(P);
I = eye(n-k);
Hsys = horzcat(Pt, I)
Hsyst = transpose(Hsys)
disp("Syndrome Table");
range = (0:6)';
table = horzcat(range, Hsyst)