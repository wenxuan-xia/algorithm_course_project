function [ res ] = check_pos( rect_pos, pos, len, wid, total_LEN)
%CHECK_POS Summary of this function goes here
%INPUT:
%   rect_pos:   rect position exist already,
%               n*4 format: (leftx, bottom y, len, wid)
%   pos:    insert position 
%               n*2 format: (leftx, lefty)
%   len:    rect_length
%   wid:    rect_width
%   total_LEN:  right_boundary;

%OUTPUT:
%   res:    0:can not insert    /   1:able to insert


rect_size = size(rect_pos, 1);

% when dir = 0;
res = 0;
dir = 0;
left_pos = pos(1,1);
down_pos = pos(1,2);
right_pos = left_pos + len;
up_pos = down_pos + wid;
check_flag = 1;

if (right_pos > total_LEN) check_flag = 0; end
for i=1:rect_size
    if (check_flag == 0) break; end
    if (rect_pos(i,1) >= right_pos) continue; end
    if (rect_pos(i,1)+rect_pos(i,3) <= left_pos) continue; end
    if (rect_pos(i,2) >= up_pos) continue; end
    if (rect_pos(i,2)+rect_pos(i,4) <= down_pos) continue; end
    % if no conjuct in axis, surely no overlap.
    if ((rect_pos(i,1) <= left_pos) && (rect_pos(i,1)+rect_pos(i,3) > left_pos) )
        check_flag = 0;
        break;
    end
    if ((rect_pos(i,1) < right_pos) && (rect_pos(i,1)+rect_pos(i,3) >= right_pos) )
        check_flag = 0;
        break;
    end
    if ((rect_pos(i,2) <= down_pos) && (rect_pos(i,2)+rect_pos(i,4) > down_pos) )
        check_flag = 0;
        break;
    end
    if ((rect_pos(i,2) < up_pos) && (rect_pos(i,2)+rect_pos(i,4) >= up_pos) )
        check_flag = 0;
        break;
    end
    % totally overlap
    if ((down_pos <= rect_pos(i,2)) && (up_pos >= rect_pos(i,2) + rect_pos(i,4)))
        check_flag = 0;
        break;
    end
    if ((left_pos <= rect_pos(i,1)) && (right_pos >= rect_pos(i,1) + rect_pos(i,3)))
        check_flag = 0;
        break;
    end
end


if (check_flag)
    res = 1;
else
    res = 0;
end


end


