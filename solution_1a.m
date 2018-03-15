function [x] = solution_1a(A,b)

  [n, m] = size(A);
  if n~= m
    error('matrix A harus merupakan square matrix')
  end
  if n ~= size(b)(1)
    error('dimensi matrix A tidak sesuai dengan vector b')
  end

  [lower, upper] = bandwidth(A);
  if (lower == n-1 && upper == n-1)
    error('matrix A bukanlah matrix pita');
  end

  [L, U, P] = LU_factorization(A,n, lower, upper);
  y = forward_elimination(L, P*b, n);
  x = backward_substitution(U, y, n);
end
