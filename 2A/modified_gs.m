function [Q,R] = modified_gs(A)
    [m,n] = size(A);
    Q = zeros(m,n);
    R = zeros(m,m);
    for j=1:m
        v = A(:,j); % get column 
        for i=1:j-1 
            R(i,j) = Q(:,i)'*A(:,j); % semua transpose columnnya Q * columnnya A
            v=v-R(i,j)*Q(:,i); % v - R(i,j) * semua column Q
        end
    R(j,j) = norm(v); 
    Q(:,j) = v/R(j,j); % normalisasi dengan norm. Q yang diisi dengan hasil normalisasi
    end
end
