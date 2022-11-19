param days;

param week_schedule{i in 1..days,j in 1..days};
param requirement{i in 1..days};

var nurse{i in 1..days} integer >=0;


minimize nurse_needed : sum{i in 1..days}nurse[i];

s.t. day_nurse_need{i in 1..days}: sum{j in 1..days}week_schedule[i,j]*nurse[j]>=requirement[i];
