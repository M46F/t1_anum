function [time, err, real_res] = generate_test_1a(n, b)
  A = spdiags(rand(n,2*b+1),-b:b,n,n);
  b = sprand(n,1,1);

% untuk memastikan matriks non singular
  for i=1:n
    tmp = 0;
    for j=1:n-1
      tmp = tmp + A(j,i);
    end
    if tmp == A(n,i)
      A(n,i)=A(n,i)+1;
      A(i,n)=A(n,i);
    end
  end

  tic;
  x = solution_1a(A,b);
  time = toc;
  err = norm(A*x - b);
  real_res = A\b;
end
