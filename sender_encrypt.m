function am = sender_encrypt(message, key)
% _
% The Invertible Matrix Encryption (Step 1)
% FORMAT am = sender_encrypt(message, key)
% 
%     message - string, message to encrypt
%     key     - string, key to use for encryption
% 
%     am      - sender-encrypted message, matrix represented as string
% 
% Author: Joram Soch
% E-Mail: JoramSoch@web.de
% Date  : 17/11/2022, 12:34


% Transform message string to matrix
%-------------------------------------------------------------------------%
n = ceil(sqrt(sqrt(2)*length(message)));
m = ceil(length(message)/n);
% Explanation: ratio n / m should be approximately sqrt(2)
message = sprintf('%s%s', message, repmat(' ',[1 n*m-length(message)]));
% Explanation: add spaces, so that m & n divide message length
M = double(reshape(message,[m n])');
% Explanation: transform to n x m matrix, convert to ASCII numbers
M = [zeros(n+2,1), [zeros(1,m); M; zeros(1,m)], zeros(n+2,1)];
% Explanation: add zeros at left/right/top/bottom to make non-invertible
n = size(M,1);
m = size(M,2);

% Transform key string to square matrix
%-------------------------------------------------------------------------%
seed = mod(prod(double(key)), 2^32);
rng(seed);
A = wishrnd(eye(n),n);

% Transform encrypted message to string
%-------------------------------------------------------------------------%
AM = A*M;
am = convert_mat2str(AM);