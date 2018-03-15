function test_sor(w, mat_size)
  if nargin == 0
    w = 1.5;
  endif
  if nargin == 1
    mat_size = [5 10 50 100 500 1000 1500 2000 2500 3000];
   endif
  
  for test_size = mat_size
    fprintf("Test size : %i\n", test_size);
    sym_mat = generateSymmetricMatrix(test_size);
    b = generateResultVector(test_size);
    tic;
    x = sor(sym_mat, b, w);
    toc;
    err = calculateError(sym_mat, x, b);
    fprintf("Error for symmetric : %f\n", err);
    
    spd_mat = generateSPDMatrix(test_size);
    b = generateResultVector(test_size);
    tic;
    x = sor(spd_mat, b, w);
    toc;
    err = calculateError(spd_mat, x, b);
    fprintf("Error for SPD : %f\n", err);
    
    hil_mat = hilb(test_size);
    b = generateResultVector(test_size);
    tic;
    x = sor(hil_mat, b, w);
    toc;
    err = calculateError(hil_mat, x, b);
    fprintf("Error for hilbert : %f\n", err);
    
    ban_mat = generateBandedMatrix(test_size, idivide(test_size,2, 'floor'));
    b = generateResultVector(test_size);
    tic;
    x = sor(ban_mat, b, w);
    toc;
    err = calculateError(ban_mat, x, b);
    fprintf("Error for banded : %f\n", err);
  endfor
endfunction

function b = generateResultVector(n)
  b = randn(n, 1);
endfunction

function err = calculateError(A, x, b)
  err = norm(A * x - b);
endfunction
