/* the repo's "persistent work library" pattern from autoexec.sas:
     libname workx wpd "d:/wpswrkx";
   The wpd engine and Windows path are UltraEdit/Altair-SLC-specific, so
   this bundle points the same libname at a portable relative directory
   and exercises the repo's documented cleanup step:
     proc datasets lib=workx kill;
     run;quit; */

libname workx "./workx";

data workx.persisted;
  length id 8 name $12;
  input id name $;
  datalines;
1 alpha
2 bravo
3 charlie
;
run;

proc print data=workx.persisted noobs;
  title "Contents of the persistent workx library";
run;

/* README section 1, step 3: "If you want to clear the contents of
   'd:/wpswrk' just run this" */
proc datasets lib=workx kill nolist;
run;
quit;

proc sql;
  select memname
  from dictionary.tables
  where libname="WORKX";
quit;
