param n;
param p;

param c{i in 1..n};
param b{i in 1..p};

param A{j in 1..p, i in 1..n};

var u{i in 1..n};

minimize object: sum{i in 1..n}c[i]*u[i];

s.t. constraints1{j in 1..p}: sum{i in 1..n}A[j,i]*u[i]>=b[j];
s.t. constraints2{i in 1..n}: u[i]>=0;