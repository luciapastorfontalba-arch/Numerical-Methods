function [g, error]= Rombergerror(f,a,b,k)

%f function to evaluate 
%a lower bound of the interval
%b upper bound of the interval
%k number of iterations

g = zeros(k + 1, k + 1); % Initialize the Richardson matrix

for i=1:k+1

    g(i,1)= Trapcomp(f,a,b,2^(i-1)+1)


end


for i=2:k+1
    for j=i:k+1
        g(j,i)=g(j,i-1)+(g(j,i-1)-g(j-1,i-1))./(4.^(i-1)-1);
    end
end


error = zeros(k , k )

for i=2:k+1

 for j=i:k+1
        error(j,i)=(g(j,i-1)-g(j-1,i-1))./(4.^(i-1)-1);
    end

end