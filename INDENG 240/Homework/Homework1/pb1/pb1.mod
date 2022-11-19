param n;
param order{i in 1..n};

param costPerTon{i in 1..n};
param inventoryCondition{i in 1..n};


param capacity ;
param invCostPerTon ;
param startInventory ;
param prodChangeCost ;


param matrix{i in 1..n,j in 1..n};


var production{i in 1..n}>=0;
var u{j in 1..(n-1)} >= 0;



minimize cost: (sum{i in 1..n} production[i]*costPerTon[i])
+ prodChangeCost*(sum{j in 1..(n-1)}u[j])
+ invCostPerTon*(3*(production[1]-order[1]+startInventory)+2*(production[2]-order[2])+(production[3]- order[3]));

s.t. realLife{i in 1..n}: startInventory + (sum{j in 1..n}(production[j]-order[j])*matrix[i,j]) >= inventoryCondition[i];
s.t. plantCapacity{i in 1..n} : production[i]<=capacity;
s.t. absolute1{i in 1..(n-1)}: u[i]>=production[i]-production[i+1];
s.t. absolute2{i in 1..(n-1)}: u[i]>=production[i+1]-production[i];
