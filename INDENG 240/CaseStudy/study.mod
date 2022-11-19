
set LINE;
set SIZE;

param labour;
param alumin;
param particle;
param pish ;
param profit{i in SIZE,j in LINE};
param orders{i in SIZE,j in LINE};
param aluminium{i in SIZE,j in LINE};
param particle_board{i in SIZE,j in LINE};
param pine_sheets{i in SIZE,j in LINE};
param line1_time{i in SIZE,j in LINE};
param line2_time{i in SIZE,j in LINE};
param line3_time{i in SIZE,j in LINE};
param prod_line1;
param prod_line2;
param prod_line3;
param a_finishing{i in SIZE,j in LINE};
param hf{i in SIZE,j in LINE};
param low_quot_line{i in LINE};
param high_quot_line{i in LINE};

param low_quot_size{i in SIZE};
param high_quot_size{i in SIZE};


var production{i in SIZE,j in LINE}>=0;
var total =sum{k in LINE,p in SIZE}production[p,k];
 
maximize obj : sum{i in SIZE,j in LINE}profit[i,j]*production[i,j];


s.t. o{i in SIZE,j in LINE} : production[i,j] >= orders[i,j];

s.t. tlabour : 2*(sum{i in LINE,j in SIZE}production[j,i]*(line3_time[j,i]+line2_time[j,i]+line1_time[j,i]))+sum{i in LINE,j in SIZE}production[j,i]*(hf[j,i]+a_finishing[j,i])<= labour;

s.t. alu : sum{i in LINE,j in SIZE}production[j,i]*aluminium[j,i] <= alumin ;

s.t. part :sum{j in SIZE}production[j,'ECONOMY']*particle_board[j,'ECONOMY']<= particle ;

s.t. pine : sum{i in LINE,j in SIZE} pine_sheets[j,i]*production[j,i] <= pish ;


s.t. line1 : sum{i in LINE, j in SIZE}production[j,i]*line1_time[j,i] <= prod_line1;
s.t. line2 : sum{i in LINE,j in SIZE}production[j,i]*line2_time[j,i] <= prod_line2;
s.t. line3 : sum{i in LINE,j in SIZE}production[j,i]*line3_time[j,i] <= prod_line3;

/*s.t. quotas_line1{i in LINE} : 0 <= (sum{j in SIZE}production[j,i])-low_quot_line[i]*total;
s.t. quotas_size1{i in SIZE} : 0 <= (sum{j in LINE}production[i,j])- low_quot_size[i]*total;

s.t. quotas_line2{i in LINE} : (sum{j in SIZE}production[j,i])-high_quot_line[i]*total<=0;
s.t. quotas_size2{i in SIZE} : (sum{j in LINE}production[i,j])-high_quot_size[i]*total<=0;
*/

s.t. economy_min : total*0.2 <= (sum{j in SIZE}production[j,'ECONOMY']);
s.t. economy_max : 0 >= (sum{j in SIZE}production[j,'ECONOMY'])-total*0.5;

s.t. basic_min : 0 <= (sum{j in SIZE}production[j,'BASIC'])-total*0.4;
s.t. basic_max : 0 >= (sum{j in SIZE}production[j,'BASIC'])-total*0.6;

s.t. hf_min : 0 <= (sum{j in SIZE}production[j,'HANDCRAFTED'])-total*0.1;
s.t. hf_max : 0 >= (sum{j in SIZE}production[j,'HANDCRAFTED'])-total*0.2;

s.t. student_min : (sum{j in LINE}production['STUDENT',j])-0.2*total>=0;
s.t. student_max : (sum{j in LINE}production['STUDENT',j])-0.35*total<=0;

s.t. standard_min :(sum{j in LINE}production['STANDARD',j])-0.4*total>=0;
s.t. standard_max : (sum{j in LINE}production['STANDARD',j])-0.7*total<=0;

s.t. executive_min :(sum{j in LINE}production['EXECUTIVE',j])-0.05*total>=0;
s.t. executive_max : (sum{j in LINE}production['EXECUTIVE',j])-0.15*total<=0;
