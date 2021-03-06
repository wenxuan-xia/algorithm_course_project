function [ res ] = my_algorithm( seq, n, mem, max_n)
%MY_ALGORITHM Summary of this function goes here
%   INPUT:
%       seq:    the generation seq
%       n:      length of seq
%       mem:    length of mem
%       max_n:  the largest number of seq
%
%   OUTPUT:
%       res:    the number of diff num in seq
%

memory= -1 * ones(1, mem);      %record memory
prob = zeros(1, mem);         %record the probability
res = 0;
rate = max_n/mem;

for i=1:mem
    memory(1,i) = floor(rate*(i-1));
end


for i=1:n
    tmp = seq(1,i);             %read i-th number in seq
%    j = 1;
%    while ((j<=mem) && (tmp>memory(1,j)))
%        j = j + 1;
%    end
%    j = j - 1;
%    q = ceil(tmp/rate);
    j = ceil(tmp/rate);
    po = prob;
    if (rand()>prob(1,j))
        res = res + 1;
        prob(1,j) = prob(1,j) + 1/rate;
    end
end

end

