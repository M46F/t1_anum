function x = sor (A, b, w, tol)
  if nargin == 2
    w = 1;
    tol = 1e-3;
  endif
  
  if nargin == 3
    tol = 1e-4;
  endif

  % Error checking
  if w < 0 || w > 2 
    error("Invalid relaxation factor, w must be within range 0 < w < 2")
  endif
  
  if !issquare(A)
    error("A must be square matrix")
  endif
  
  if size(A, 1) != size(b, 1)
    error("Matrix size mismatched")
  endif
  
  % Init x
  x = zeros(size(b));

  n = size(b,1);
   while true
    x_1 = x;
    for i = 1:n
      theta = 0;
      for j = 1:n
        if i != j
          theta += A(i,j) * x(i);
        endif
      endfor
      x(i) += w * ((b(i)-theta)/A(i,i) - x(i));
      %x(i) = (1 - w) * x(i) + w/A(i,i) * (b(i) - theta);
    endfor
    err = norm(x_1 - x, 1);
    if (err < tol)
      break
    endif
  endwhile
end