clear all;close all;clc

Np = 37;
K = 1;


u = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571];
n = (0:1:Np-1);

u = 17;

P = exp((-1i.*pi.*u.*n.*(n+1))./Np);              % Normalized pilot signal, i.e., unit power.

xuv = zeros(10,Np);
for Cv=0:1:Np-1
    xuv(Cv+1,:) = P(mod((n-Cv),Np)+1);
end

res = abs(xuv(1,:).*conj(xuv(30,:))).^2;


P1 = exp((-1i.*pi.*29.*n.*(n+1))./Np);              % Normalized pilot signal, i.e., unit power.
P2 = exp((-1i.*pi.*37.*n.*(n+1))./Np);              % Normalized pilot signal, i.e., unit power.

res1 = P1.*conj(P2);