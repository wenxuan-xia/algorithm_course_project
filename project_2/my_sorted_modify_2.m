function [ rect ] = my_sorted_modify_2( rect )
%MY_SORTED_MODIFY Summary of this function goes here
%   Detailed explanation goes here

re_list = [rect(1,1)];
left = 1;
size(rect, 1)
for i=2:size(rect,1)
    if (rect(i,2) ~= rect(i-1,2))
       rect(left:i-1, 1) = sort(rect(left:i-1, 1));
       left = i;
    end
end

end

