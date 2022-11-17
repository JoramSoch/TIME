function amb = receiver_encrypt(am, key)
% _
% The Invertible Matrix Encryption (Step 2)
% FORMAT amb = receiver_encrypt(am, key)
% 
%     am  - sender-encrypted message, matrix represented as string
%     key - string, key to use for encryption
% 
%     amb - receiver-encrypted message, matrix represented as string
% 
% Author: Joram Soch
% E-Mail: JoramSoch@web.de
% Date  : 17/11/2022, 10:50


% Transform message string to matrix
%-------------------------------------------------------------------------%
AM = str2num(am);
n  = size(AM,1);
m  = size(AM,2);

% Transform key string to square matrix
%-------------------------------------------------------------------------%
seed = mod(prod(double(key)), 2^32);
rng(seed);
B = wishrnd(eye(m),m);

% Transform encrypted message to string
%-------------------------------------------------------------------------%
AMB = AM*B;
amb = convert_mat2str(AMB);