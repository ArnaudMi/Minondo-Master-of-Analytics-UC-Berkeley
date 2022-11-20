param n;

param Demand{1..n};

param Prod_Cost;
param Purchase_Cost;
param Produc_Limit;

var produc{1..n};
var purchase{1..n};

minimize cost : (sum{i in 1..n}(produc[i]*Prod_Cost+purchase[i]*Purchase_Cost+(sum{j in 1..i}(produc[j]+purchase[j]-Demand[j]))*5));

s.t. Demand_Cons{i in 1..n} : sum{j in 1..i}(produc[j]+purchase[j]-Demand[j])>=0;
s.t. Produc_Cons{i in 1..n} : produc[i]<= Produc_Limit;
s.t. Produc_Positivity{i in 1..n} : produc[i]>=0;
s.t. Purchase_Positivity {i in 1..n} : purchase[i]>=0;
