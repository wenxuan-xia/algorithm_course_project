function [ WID, rect_pos ] = my_algorithm_process( rect, LEN )
%MY_ALGORITHM_PROCESS Summary of this function goes here
%INPUT:
%   rect:   n*2 mtx, sorted rects format (len, wid)
%   LEN:    assumed rect lengthkey_pos = [key_pos; [rect_pos(insert_idx, 1), rect_pos(insert_idx, 2) + insert_way(1,2)]];
%   
%OUTPUT:
%   WID:    the width of the large rect.

rect_pos = [];
key_pos = [0,0];
rect_pos = [0,0,0,0];
WID = 0;
num = size(rect,1);
for i=1:num
    chs = 0;    %choose
    hi = 100000;
    insert_idx = 0;
    insert_way = [-1, -1];
    for j=1:size(key_pos, 1)
        if (check_pos(rect_pos, key_pos(j, :), rect(i,1), rect(i,2), LEN) == 1)
            tmphi = key_pos(j, 2) + rect(i,2);
            if (tmphi < hi)
                hi = tmphi;
                insert_idx = j;
                insert_way = [rect(i,1), rect(i,2)];
            end
        end
        if (check_pos(rect_pos, key_pos(j, :), rect(i,2), rect(i,1), LEN) == 1)
            tmphi = key_pos(j, 2) + rect(i,1);
            if (tmphi < hi)
                hi = tmphi;
                insert_idx = j;
                insert_way = [rect(i,2), rect(i,1)];
            end
        end
    end
    rect_pos = [rect_pos; [key_pos(insert_idx, 1), key_pos(insert_idx, 2), insert_way(1, 1), insert_way(1, 2)]];
    key_pos = [key_pos; [key_pos(insert_idx, 1), key_pos(insert_idx, 2) + insert_way(1,2)]];
    key_pos = [key_pos; [key_pos(insert_idx, 1) + insert_way(1,1), key_pos(insert_idx, 2)]];
    
    rows = size(key_pos, 1);
    key_pos = [key_pos(1:insert_idx-1, :); key_pos(insert_idx+1:rows, :)];
    WID = max(hi, WID);
end

end
