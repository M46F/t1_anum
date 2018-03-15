function A = generateBandedMatrix(n, m)
  A = rand(n);
  A = A - tril(A, -m) - triu(A, m);
endfunction