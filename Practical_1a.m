A = [2 4 6; 4 6 8; 6 8 10];
B = [2 2 6; 2 -1 5; 2 3 1];
disp("Matrix A");
disp(A);
disp("Matrix B");
disp(B);
C = A';
disp("Transpose of A");
disp(C);
C = A .* B;
disp("Respective Elements Multiplication");
disp(C);
C = A * B;
disp("Matrix Multiplication");
disp(C);
C = inv(B);
disp("Matrix Inverse of B");
disp(C);
C = A / B
disp("A * Inv(B) i.e. A / B");
disp(C);
C = A ./ B
disp("Respective Element Division");
disp(C);