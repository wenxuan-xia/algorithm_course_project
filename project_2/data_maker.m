function [ rect ] = data_maker(num, data_type, len, wid)
%DATA_MAKER Summary of this function goes here
%
%FUNCTION:  generate random data for testing
%INPUT:     num:    rect num
%           data_type:  method of the ramdom
%                       1. uniform
%                       2. exponential 
%           len:    max length of rects for uniform distribution
%                   expect length for exponential distribution
%           wid:    max width of rects
%                   expect width for exponential distribution
%                       1. 
%OUTPUT:    rect:   an ([n, 2]) dimention matrix
%                   record n rects of (len, wid)


if (data_type == 1)
    rect = [unidrnd(len, 1, num); unidrnd(wid, 1, num)];
end

if (data_type == 2)
    rect = [exprnd(len, 1, num); exprnd(wid, 1, num)];
end

rect = ceil(rect');

end

