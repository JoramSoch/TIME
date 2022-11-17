% TIME example script
% _
% The Invertible Matrix Encryption (Demo)
% 
% Author: Joram Soch
% E-Mail: JoramSoch@web.de
% Date  : 06/11/2022, 18:27


clc
clear

% Step 0: specify message
%-------------------------------------------------------------------------%
message = 'Zutritt verboten für Spinnen und Westgoten!';
fprintf('\n-> Step 0: specify message:\n   "%s"\n', message);
%|-> Step 0: specify message:
%|   "1608.295070290,1017.013219685,123.498403334,1430.840698386,1292.274244933,1694.820622641,505.529332481;522.311722077,406.240804128,288.084071810,444.877841725,663.456560800,481.870004997,144.090234263;1671.059528146,1265.174569950,490.270238623,1514.182529790,1569.956124790,1674.863714343,495.100506697;505.880056463,584.680490594,562.901491349,525.331192649,453.574899451,478.399204999,133.520646678;-638.216979722,-369.592055679,962.745478279,-424.416201297,-867.564270044,-507.626050761,-182.154280572;-150.429919254,-117.910901076,-796.489743181,-291.539259909,126.872922047,-335.261113758,-64.603285022;970.419617630,628.283580204,30.010559143,917.821415772,518.171924617,1084.397884718,317.909282956"

% Step 1: sender encrypts message
%-------------------------------------------------------------------------%
sender_key = 'Bengini';
am = sender_encrypt(message, sender_key);
fprintf('\n-> Step 1: sender encrypts message:\n   "%s"\n', am);
%|-> Step 1: sender encrypts message:
%|   "1608.295070290,1017.013219685,123.498403334,1430.840698386,1292.274244933,1694.820622641,505.529332481;522.311722077,406.240804128,288.084071810,444.877841725,663.456560800,481.870004997,144.090234263;1671.059528146,1265.174569950,490.270238623,1514.182529790,1569.956124790,1674.863714343,495.100506697;505.880056463,584.680490594,562.901491349,525.331192649,453.574899451,478.399204999,133.520646678;-638.216979722,-369.592055679,962.745478279,-424.416201297,-867.564270044,-507.626050761,-182.154280572;-150.429919254,-117.910901076,-796.489743181,-291.539259909,126.872922047,-335.261113758,-64.603285022;970.419617630,628.283580204,30.010559143,917.821415772,518.171924617,1084.397884718,317.909282956"

% Step 2: receiver encrypts message
%-------------------------------------------------------------------------%
receiver_key = '1997';
amb = receiver_encrypt(am, receiver_key);
fprintf('\n-> Step 2: receiver encrypts message:\n   "%s"\n', amb);
%|-> Step 2: receiver encrypts message:
%|   "4120.329395834,4643.888375766,-7635.636214049,9645.943409444,7898.186187420,11561.767967790,-1500.219686545;713.443487945,824.318527140,-398.476090013,3000.867790746,5172.118212384,2463.307449040,-719.211045142;3969.679630692,4411.780881003,-5540.367624847,9568.533284221,10809.419268235,10391.551168976,-1610.894497983;1485.447086990,1456.094062492,43.703078482,1774.797322385,3919.256336526,1853.160290445,-273.466400871;-1539.302552995,-2156.294190898,6265.842174835,-6646.346502760,-3292.207274180,-6401.167576496,531.907449255;-289.145463982,-58.446552614,-1597.828080515,868.662859155,-1001.919615033,-58.909492573,392.463557741;3238.590919101,3535.516341542,-5880.630433524,5410.486831795,2436.835908930,7682.557505249,-584.966684582"

% Step 3: sender decrypts message
%-------------------------------------------------------------------------%
mb = sender_decrypt(amb, sender_key);
fprintf('\n-> Step 3: sender decrypts message:\n   "%s"\n', mb);
%|-> Step 3: sender decrypts message:
%|   "185.023081047,176.231382662,-101.878598118,244.446461692,393.345722514,481.875882457,-113.348601996;268.778826958,298.816544833,-32.738611367,468.472094624,970.347893353,517.390130028,-90.107496304;330.572578057,333.791030121,-364.418953142,649.944734105,726.917551433,633.307270871,-82.446692706;310.794629390,323.675670990,-89.752199735,434.628499606,811.888276023,502.360363185,-67.092589344;306.738645097,227.817149415,498.721051143,-114.699667421,671.140733803,63.760748849,-54.092632840;361.610968787,342.823498731,-6.405353933,310.715618567,703.057202253,374.756904277,-26.969367699;378.402141971,417.366068346,-441.528902910,609.807425985,625.136340709,718.317033020,-42.445534090"

% Step 4: receiver decrypts message
%-------------------------------------------------------------------------%
mess_dec = receiver_decrypt(mb, receiver_key);
fprintf('\n-> Step 4: receiver decrypts message:\n   "%s"\n', mess_dec);
%|-> Step 4: receiver decrypts message:
%|   "Zutritt verboten für Spinnen und Westgoten!      "
fprintf('\n');