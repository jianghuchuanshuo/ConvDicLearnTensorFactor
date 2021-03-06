function w = cconv2_reverse_revised(f,h)
assert(size(f,1)==size(f,2));
assert(size(h,1)==size(h,2));
assert(size(h,1)==size(f,1));
n= size(f,1);

h_vec = h(:);
f_vec = f(:);
f_vec = flip(f_vec);
f_mat = reshape(f_vec,n,n);
U = EigenVector4Circulant(n);
F = fft2(f_mat); F = F(:);
BlkCir = kronecker_prod4mat(U,U) * diag(F) * kronecker_prod4mat(U,U)';
BlkCir = real(BlkCir);
w_vec = flip(BlkCir * h_vec); w = reshape(w_vec,n,n);
%%
% h_vec = h(:);
% h_vec = flip(h_vec);
% U = EigenVector4Circulant(n);
% F = fft2(f); F = F(:);
% BlkCir = kronecker_prod4mat(U,U) * diag(F) * kronecker_prod4mat(U,U)';
% BlkCir = real(BlkCir);
% w_vec = flip(BlkCir * h_vec); w = reshape(w_vec,n,n);