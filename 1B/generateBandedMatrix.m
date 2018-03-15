function A = generateBandedMatrix(n, m)
  A = randn(n);
  A = A - tril(A, -m) - triu(A, m);
endfunction