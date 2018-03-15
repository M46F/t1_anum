function [x] = least_square_problem_solver_rq(A, b)
  [m, n] = size(A);
  [R,Q] = rq(A);
  Rx = Q'*b;
  x = R\Rx;
end
