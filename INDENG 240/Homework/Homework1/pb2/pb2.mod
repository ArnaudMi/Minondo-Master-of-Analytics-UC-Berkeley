set SCENS;
set VARS;



param matrix {SCENS, VARS};

param amount_bet;

var strategy{VARS} >= 0;
var w >= 0;

maximize win: w;


s.t. budget: sum{i in VARS}strategy[i] <= amount_bet;
s.t. scen{j in SCENS}: w <= sum{i in VARS}matrix[j, i]*strategy[i];