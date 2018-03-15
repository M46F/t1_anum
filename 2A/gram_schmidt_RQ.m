% sumber https://ksimek.github.io/2012/08/14/decompose/
% Flip QR menjadi RQ, rumus Gram-Schmdit QR dimodifikasi
% agar bisa mengatasi overdetermined system
function [R Q] = gram_schmidt_RQ(M)
    [Q,R] = gram_schmidt_modified(flipud(M)');
    R = flipud(R');
    R = fliplr(R);
    Q = Q';   
    Q = flipud(Q);
end
