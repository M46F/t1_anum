function [time, err] = generate_test_1a(n, b)
  A = spdiags(rand(n,2*b+1),-b:b,n,n);
  b = sprand(n,1,1);

  tic;
  x = solution_1a(A,b);
  time = toc;
  err = norm(A*x - b);
end
