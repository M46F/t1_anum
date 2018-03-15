function [x] = least_square_problem_solver_rq(A, b)
  [m, n] = size(A);
  [R,Q] = gram_schmidt_RQ(A);
  x = R*Q\b;
end
