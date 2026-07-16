/* cap input rows for the captured run */
options obs=100;

/* from the repo's autoexec.sas: the "enhanced options" block that no
   longer requires &_init_ (their README, section 1) */
options ls=255 ps=65
 nofmterr nocenter
 nodate nonumber
 noquotelenmax
 validvarname=upcase
 nolabel
 compress=no
 FORMCHAR='|----|+|---+=|-/\<>*'
;
run;quit;
