/* the "handy macro variables" block from the repo's autoexec.sas, verbatim */

%let lettersq=
 "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z";
%let letters=A B C D E F G H I J K L M N O P Q R S T U V W X Y Z;
%let letter=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz;

%let numbersq=%str("1","2","3","4","5","6","7","8","9","10");
%let numbers=1 2 3 4 5 6 7 8 9 10;
%let number=12345678910;

%let states50q="AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME"
,"MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD"
,"TN","TX","UT","VT","VA","WA","WV","WI","WY";

%let states50= %sysfunc(compbl(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT
NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)) ;

%let monthsq="JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT", "NOV", "DEC" ;
%let months = JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC;

%let daysq="Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday";
%let days=Monday Tuesday Wednesday Thursday Friday Saturday Sunday;

%let daysabvq="Mon","Tue","Wed","Thu","Fri","Sat","Sun";
%let daysabv=Mon Tue Wed Thu Fri Sat Sun;

%let stateslnq=%sysfunc(compbl(%str(
 "Alabama"        ,"Alaska"         ,"Arizona"        ,"Arkansas"
,"California"     ,"Colorado"       ,"Connecticut"    ,"Delaware"
,"Florida"        ,"Georgia"        ,"Hawaii"         ,"Idaho"
,"Illinois"       ,"Indiana"        ,"Iowa"           ,"Kansas"
,"Kentucky"       ,"Louisiana"      ,"Maine"          ,"Maryland"
,"Massachusetts"  ,"Michigan"       ,"Minnesota"      ,"Mississippi"
,"Missouri"       ,"Montana"        ,"Nebraska"       ,"Nevada"
,"New Hampshire"  ,"New Jersey"     ,"New Mexico"     ,"New York"
,"North Carolina" ,"North Dakota"   ,"Ohio"           ,"Oklahoma"
,"Oregon"         ,"Pennsylvania"   ,"Rhode Island"   ,"South Carolina"
,"South Dakota"   ,"Tennessee"      ,"Texas"          ,"Utah"
,"Vermont"        ,"Virginia"       ,"Washington"     ,"West Virginia"
,"Wisconsin"      ,"Wyoming")));

/* demonstrate the macro variables resolve as intended */
data macrovars;
  length name $12 value $250;
  name="letters";  value="&letters";  output;
  name="numbers";  value="&numbers";  output;
  name="states50"; value="&states50"; output;
  name="months";   value="&months";   output;
  name="days";     value="&daysabv";  output;
run;

proc print data=macrovars noobs;
  var name value;
  title "Handy macro variables from the enhanced autoexec";
run;
