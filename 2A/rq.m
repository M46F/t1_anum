function [R Q] = gs_rq(M)
    [Q,R] = modified_gs(flipud(M)');
    R = flipud(R');
    R = fliplr(R);
    Q = Q';   
    Q = flipud(Q);
end

