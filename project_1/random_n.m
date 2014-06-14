function [ seq, optimal_ans ] = random_n(max_n, n)
%RANDOM_N Summary of this function goes here
%   FUNCTION:
%       generate a seq of integer, and find the optimal result of the seq
%   INPUT:
%       n:      the length of the seq
%       max_n:  the maxinum number of seq
%
%   OUTPUT:
%       seq:    the generation seq.
%       optimal_ans:    the optimal-cost of this seq

seq = unidrnd(max_n, 1, n);
optimal_ans = length(unique(seq));

end

