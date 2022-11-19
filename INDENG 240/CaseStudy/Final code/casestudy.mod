set LINE;
set SIZE;


param profit{LINE,SIZE};

 
param s_orders{LINE,SIZE};
param alum{LINE,SIZE};
param particle{LINE,SIZE};
param pine{LINE,SIZE};
param pline_1{LINE,SIZE};
param pline_2{LINE,SIZE};
param pline_3{LINE,SIZE};
param assembly{LINE,SIZE};
param hand_craft{LINE,SIZE};
#variables;
var x{LINE,SIZE} >=0;
var total = sum{k in LINE,p in SIZE}x[k,p];
#var production_line = sum{i in LINE,j in SIZE} x[i,j] * (( pline_1[i,j] + pline_2[i,j] + pline_3[i,j])*2)

#objective
maximize p: 
	sum{i in LINE, j in SIZE}x[i,j] * profit[i,j];
	
subject to sept_orders{i in LINE,j in SIZE}:
	x[i,j] >= s_orders[i,j];

subject to aluminium:
	sum{i in LINE,j in SIZE}x[i,j] * alum[i,j] <= 65000;
	
subject to particle_board:
	sum{i in LINE,j in SIZE}x[i,j] * particle[i,j] <= 60000;

subject to pine_sheet:
	sum{i in LINE,j in SIZE}x[i,j] * pine[i,j] <= 175000;
	
subject to productionline_1:
	sum{i in LINE,j in SIZE}x[i,j] * pline_1[i,j] <= 9600;
	
subject to productionline_2:
	sum{i in LINE,j in SIZE}x[i,j] * pline_2[i,j] <= 9600;
	
subject to productionline_3:
	sum{i in LINE,j in SIZE}x[i,j] * pline_3[i,j] <= 19200;
	
subject to labor:
	sum{i in LINE,j in SIZE}(x[i,j] * ((pline_1[i,j] + pline_2[i,j] + pline_3[i,j])*2 + hand_craft[i,j] + assembly[i,j]))  <= 230400;
	



s.t. economy_min : 0 <= (sum{j in SIZE}x['L1',j])-total*0.2;
s.t. economy_max : 0 >= (sum{j in SIZE}x['L1',j])-total*0.5;

s.t. basic_min : 0 <= (sum{j in SIZE}x['L2',j])-total*0.4;
s.t. basic_max : 0 >= (sum{j in SIZE}x['L2',j])-total*0.6;

s.t. hf_min : 0 <= (sum{j in SIZE}x['L3',j])-total*0.1;
s.t. hf_max : 0 >= (sum{j in SIZE}x['L3',j])-total*0.2;

s.t. student_min : (sum{j in LINE}x[j,'S1'])-0.2*total>=0;
s.t. student_max : (sum{j in LINE}x[j,'S1'])-0.35*total<=0;

s.t. standard_min :(sum{j in LINE}x[j,'S2'])-0.4*total>=0;
s.t. standard_max : (sum{j in LINE}x[j,'S2'])-0.7*total<=0;

s.t. executive_min :(sum{j in LINE}x[j,'S3'])-0.05*total>=0;
s.t. executive_max : (sum{j in LINE}x[j,'S3'])-0.15*total<=0;

