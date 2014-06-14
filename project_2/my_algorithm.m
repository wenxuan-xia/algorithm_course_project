function [ axy, cxy] = my_algorithm(rect)
%MY_ALGORITHM Summary of this function goes here
%INPUT:
%   rect:   an [n*2] mtx, record every rects format in (len, wid)
%OUTPUT:
%   axy:    an [1*2] mtx, record [LEN, WID] of the large rect minimun
%           LEN*WID
%   cxy:    an [1*2] mtx, record [LEN, WID] of the large rect minimun
%           2*(LED + MID)
recorder = [];
num = size(rect, 1);

min_area = 999999999;
min_cir = 999999999;

LEN = rect(1,1) - rect(num, 1);
WID = 100000;

while (WID>LEN)
   LEN = LEN + rect(num, 1);
   [WID, rect_pos] = my_algorithm_process(rect, LEN);
   if (WID * LEN < min_area)
       min_area = WID*LEN;
       axy = [LEN, WID];
   end
   if (2*(LEN + WID) < min_cir)
      min_cir = 2*(LEN + WID);
      cxy = [LEN, WID];
   end
   %plot;
   nums = size(rect_pos, 1);
   figure;
   for i=2:nums
       if (mod(i, 2) == 0)
           color = 'r';
           color2 = 'g';
       else
           color = 'g';
           color2 = 'r';
       end
       rectangle('Position', [rect_pos(i,1), rect_pos(i,2), rect_pos(i,3), rect_pos(i,4)], 'edgecolor', color, 'facecolor', color2);
   end
   recorder = [recorder; [LEN, WID]];
   
end

   recorder
end
