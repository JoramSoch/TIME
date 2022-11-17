function message = receiver_decrypt(mb, key)
% _
% The Invertible Matrix Encryption (Step 4)
% FORMAT message = receiver_decrypt(mb, key)
% 
%     mb      - sender-decrypted message, matrix represented as string
%     key     - string, key to use for decryption
% 
%     message - string, decrypted message
% 
% Author: Joram Soch
% E-Mail: JoramSoch@web.de
% Date  : 17/11/2022, 10:52


% Transform message string to matrix
%-------------------------------------------------------------------------%
MB = str2num(mb);
n  = size(MB,1);
m  = size(MB,2);

% Transform key string to square matrix
%-------------------------------------------------------------------------%
seed = mod(prod(double(key)), 2^32);
rng(seed);
B = wishrnd(eye(m),m);

% Transform decrypted message to string
%-------------------------------------------------------------------------%
M = MB*inv(B);
M = M(2:end-1,2:end-1);
message = char(reshape(round(M)',[1 numel(M)]));