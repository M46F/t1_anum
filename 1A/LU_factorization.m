function [L, U, P] = LU_factorization(A, n, p, q)
    L=eye(n); P=eye(n); U=A;
    for k=1:n-1
        [_ ind]=max(abs(U(k:min(k+q,n),k)));
        ind = ind+k-1;
        if ind ~= k;
          U([k,ind],k:n)=U([ind,k],k:n);
          L([k,ind],1:k-1)=L([ind,k],1:k-1);
          P([k,ind],:)=P([ind,k],:);
        end
        for j=k+1:min(k+p, n)
            L(j,k)=U(j,k)/U(k,k);
            U(j,k:n)=U(j,k:n)-L(j,k)*U(k,k:n);
        end
    end
end
