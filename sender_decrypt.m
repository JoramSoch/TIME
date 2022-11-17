function mb = sender_decrypt(amb, key)
% _
% The Invertible Matrix Encryption (Step 3)
% FORMAT mb = sender_decrypt(amb, key)
% 
%     amb - receiver-encrypted message, matrix represented as string
%     key - string, key to use for decryption
% 
%     mb  - sender-decrypted message, matrix represented as string
% 
% Author: Joram Soch
% E-Mail: JoramSoch@web.de
% Date  : 17/11/2022, 10:51


% Transform message string to matrix
%-------------------------------------------------------------------------%
AMB = str2num(amb);
n   = size(AMB,1);
m   = size(AMB,2);

% Transform key string to square matrix
%-------------------------------------------------------------------------%
seed = mod(prod(double(key)), 2^32);
rng(seed);
A = wishrnd(eye(n),n);

% Transform decrypted message to string
%-------------------------------------------------------------------------%
MB = inv(A)*AMB;
mb = convert_mat2str(MB);