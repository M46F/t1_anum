function A = generateSymmetricMatrix(n)
  A = randn(n);
  A = A - tril(A, -1) + triu(A, 1)';
  A = A + eye(n) * n;
endfunction