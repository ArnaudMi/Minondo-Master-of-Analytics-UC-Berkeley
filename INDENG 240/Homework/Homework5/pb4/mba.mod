param coef{1..8};
param time{1..8};

param time_limit;

var choice{1..8} >=0 binary ;

maximize chance : sum{i in 1..8}choice[i]*coef[i];

s.t. t : sum{i in 1..8}time[i]*choice[i]=time_limit;