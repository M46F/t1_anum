function [x] = least_square_problem_solver_rq(A, b)
  [m, n] = size(A);
  [R,Q] = gram_schmidt_RQ(A);
  Rx = Q'*b;
  R = R(1:n,1:n);
  x = R\Rx;
end
