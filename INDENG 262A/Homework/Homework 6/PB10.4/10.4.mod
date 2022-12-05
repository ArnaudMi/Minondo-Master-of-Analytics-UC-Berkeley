param nb_year;

param nb_module;


param required{1..nb_year,1..nb_module};
param cost{1..nb_year,1..nb_module};
param full_module_cost{1..nb_year};
param full_module_required{1..nb_year};

var full_module{1..nb_year} integer;
var order{1..nb_year,1..nb_module} integer;

minimize order_cost : sum{i in 1..nb_year}full_module[i]*full_module_cost[i] +sum{k in 1..nb_year, j in 1..nb_module} order[k,j]*cost[k,j];

s.t. requirements{i in 1..nb_year, j in 1..nb_module} : sum{v in 1..i}(full_module[v]-full_module_required[v])+sum{k in 1..i}(order[k,j]-required[k,j])>=0;
s.t. full_module_requirements{i in 1..nb_year} : sum{j in 1..i}(full_module[j]-full_module_required[j])>=0;
s.t. order_positivity{i in 1..nb_year, j in 1..nb_module} : order[i,j]>=0;
s.t. full_module_positivity{i in 1..nb_year} : full_module[i]>=0