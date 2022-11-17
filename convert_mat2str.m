function a = convert_mat2str(A)
% _
% Convert Matrix to String using MATLAB Notation
% FORMAT a = convert_mat2str(A)
% 
%     A - an n x m double matrix
% 
%     a - a string, s.t. A = str2num(a)
% 
% Author: Joram Soch
% E-Mail: JoramSoch@web.de
% Date  : 17/11/2022, 10:48


% Get size of matrix
%-------------------------------------------------------------------------%
n = size(A,1);
m = size(A,2);

% Convert matrix to string
%-------------------------------------------------------------------------%
a = '';
for i = 1:n
    for j = 1:m
        a = sprintf('%s%0.9f', a, A(i,j));
        if j < m, a = sprintf('%s,', a); end;
    end;
    if i < n, a = sprintf('%s;', a); end;
end;