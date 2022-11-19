param p;
param n;

param A{i in 1..p,j in 1..n};

param b{i in 1..p};

param c{j in 1..n};

var y{i in 1..p};


maximize object: sum{i in 1..p}y[i]*b[i];

s.t. constraints{j in 1..n} :sum{i in 1..p}y[i]*A[i,j] <=c[j];