%% this is test function of m. It is allowed to change the configuration
%% and make a large number experiments.

clc;    %clean screen
clear;

%% test configurate:
    Re = 100; %repeat times
    u  = [];    %record of each optimal answer
    p  = [];    %record of each practical answer
%%


%   assume, we know the sequency length, max_number in sequence

%the number of sequency;
n       = 50000;
%the maxinum number in the seq;
max_n   = 5000000;
%memory limitation
mem = floor(log2(n));


while (Re>0)
    Re = Re - 1;
    %uniform distribution random generation, and get the optimal answer
    %   optimal answer is considered as non-memory-limited result.
    [seq, optimal_ans] = random_n(max_n, n);

    res = my_algorithm(seq, n, mem, max_n);
    u = [u optimal_ans];
    p = [p res];
end


diff = u-p;
u_mean = mean(diff)
var = var(diff)
%tabulate(diff);

cost = 1 - mean (abs(diff) / n)