param n;

param Clay{i in 1..n};
param Clay_Limit;

param Enamel{i in 1..n};
param Enamel_Limit;

param Dry_Room{i in 1..n};
param Dry_Room_Limit;

param Kiln{i in 1..n};
param Kiln_Limit;

param prof{i in 1..n};

var produc{i in 1..n};

maximize profit : sum{i in 1..n}produc[i]*prof[i];

s.t. Clay_Cons : sum{i in 1..n}Clay[i]*produc[i]<=Clay_Limit;
s.t. Enamel_Cons : sum{i in 1..n}Enamel[i]*produc[i]<=Enamel_Limit;
s.t. Dry_Room_Cons : sum{i in 1..n}Dry_Room[i]*produc[i]<=Dry_Room_Limit;
s.t. Kiln_Cons : sum{i in 1..n}Kiln[i]*produc[i]<=Kiln_Limit;
s.t. Same_Amount_Cons : produc[3]-produc[4] = 0; 
s.t. Positivity{i in 1..n}: produc[i]>=0;