param n;
param grades{i in 1..n};

param degree;

param hoursWorked{i in 1..n, j in 1..degree};


var u{i in 1..n};
var coefficients{i in 1..degree};

minimize Error :sum{i in 1..n}u[i];

s.t. absolute1{i in 1..n}: u[i] >= (sum{j in 1..degree}(coefficients[j]*hoursWorked[i,j]))-grades[i];
s.t. absolute2{i in 1..n}: u[i] >= (-1)*(sum{j in 1..degree}(coefficients[j]*hoursWorked[i,j])-grades[i]);
