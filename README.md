# TIME

### The Invertible Matrix Encryption

This MATLAB code implements *The Invertible Matrix Encryption* algorithm (TIME). In this algorithm, a message is sent back and forth between sender and receiver for encryption and decryption, so that neither sender nor receiver have to know the other party's key and third parties cannot decrypt the message without knowing the keys.


## Requirements

This code was written by [Joram Soch](https://twitter.com/JoramSoch). It was developed in [MATLAB R2021a](https://de.mathworks.com/help/matlab/release-notes.html). No further toolboxes are required.

This code has not been licensed so far. It cannot be used for commercial purposes without the author's permission.


## Theory

TIME is based on the [theory of invertible matrices in linear algebra](https://en.wikipedia.org/wiki/Invertible_matrix).

Mathematical details behind the algorithm will be added soon.


## Procedure

Sending and receiving an encrypted message using TIME consists in four steps.

```matlab
message = 'Zutritt verboten für Spinnen und Westgoten!';
```

### Step 1: sender encrypts message

First, the message (provided as a string) is converted into a non-square matrix (to prevent inversion) using the [ASCII code](https://en.wikipedia.org/wiki/ASCII) and the sender's key (given as a string) is used to generate a square matrix which is right-multiplied with the message matrix. This matrix is returned as a sequence of characters in MATLAB matrix notation.

```matlab
sender_key = 'Bengini';
am = sender_encrypt(message, sender_key);
```

### Step 2: receiver encrypts message

Second, the message reaches the receiver (as a string representing a matrix) and the receiver's key (given as a string) is used to generate a square matrix which is left-multiplied with the sender-encrypted message matrix. Now, the message is encrypted by sender and receiver and again returned as a matrix string.

```matlab
receiver_key = '1997';
amb = receiver_encrypt(am, receiver_key);
```

### Step 3: sender decrypts message

Third, the message comes back to the sender (as a string representing a matrix) and the sender's key is used to produce the inverse of the original sender encryption matrix which is right-multiplied with the encrypted message matrix. Now, the sender encryption has been removed, but the message is still encrypted by the receiver.

```matlab
mb = sender_decrypt(amb, sender_key);
```

### Step 4: receiver decrypts message

Finally, the message comes back to the receiver (as a string representing a matrix) and receiver's key is used to produce the inverse of the original receiver encryption matrix which is left-multiplied with the encrypted message matrix. Now, the receiver encryption has been removed and the message is converted back from matrix to string.

```matlab
mess_dec = receiver_decrypt(mb, receiver_key)
```

```matlab
    'Zutritt verboten für Spinnen und Westgoten!     '
```
