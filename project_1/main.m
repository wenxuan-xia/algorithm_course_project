%% this is the ENTRANCE of the program. please run it directly without any
%% parameter. If you want to change the configuration, please modify this
%% file by your self.



%   assume, we know the sequency length, max_number in sequency.
clear;
clc;    %clean screen


%the number of sequency;
n = 50000;
%the maxinum number in the seq;
max_n = 100000;
%memory limitation
mem = floor(log2(n));

%uniform distribution random generation, and get the optimal answer
%   optimal answer is considered as non-memory-limited result.
[seq, optimal_ans] = random_n(max_n, n);

res = my_algorithm(seq, n, mem, max_n);
%cost_ratio = ans/optimal_ans;