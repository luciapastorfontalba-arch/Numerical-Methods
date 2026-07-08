function r= gaussianas(f,a,b,b0,n)
% f function
% a function for alpha(n) coefficients
% b function for beta(n) coefficients
% n actual number of nodes
% b0 is the beta_0 = integral of the weight function
% r approximation

ma= zeros(n-1,n-1); % Jacobi matrix

in0=0:n-1;
in1=1:n-1;
alfas= feval(a,in0);
betas = sqrt(feval(b, in1)); % Beta function evaluated at the nodes
ma = diag(alfas)+diag(betas,1)+diag(betas,-1);

[v,d]=eig(ma);

% v  Column-normalized eigenvector matrix
% d Diagonal matrix of eigenvalues

nd= diag(d);%nodes
p=b0.*v(1,:).^2; % weight
eval= feval(f,nd);
r=p*eval




