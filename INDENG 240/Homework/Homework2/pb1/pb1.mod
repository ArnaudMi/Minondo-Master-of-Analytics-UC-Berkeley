param n;
param f{i in 1..n};
param A{i in 1..n,j in 1..n};
param time{i in 1..n};
param max_Soldier;

var production{i in 1..n};

maximize profit:sum{i in 1..n}f[i]*production[i];


s.t. time_constraints{i in 1..n} :sum{j in 1..n}A[i,j]*production[j]<= time[i];
s.t. max_demand : production[1]<=max_Soldier;  