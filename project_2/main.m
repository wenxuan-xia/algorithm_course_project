% main

%% initial
    clc;
    clear;
%%
num = 10;
type = 1;
len = 20;
wid = 15;


rect = data_maker(num, type, len, wid);

for i=1:num
    if (rect(i,1) < rect(i,2))
        t = rect(i,1);
        rect(i,1) = rect(i,2);
        rect(i,2) = t;
    end
end

[sorted_rect, idx] = sort(rect, 1, 'descend');

for i=1:num
    sorted_rect(i,2) = rect(idx(i,1), 2);
end

[axy, cxy] = my_algorithm(sorted_rect);


