# utl-altair-slc-enhanced-autoexec-file-and-ultraedit-insert-text
Altair slc enhanced autoexec file and ultraedit insert text
    %let pgm=utl-altair-slc-enhanced-autoexec-file-and-ultraedit-insert-text;

    Altair slc enhanced autoexec file and ultraedit insert text;

    Too long to post here, see github

    github
    https://github.com/rogerjdeangelis/utl-altair-slc-enhanced-autoexec-file-and-ultraedit-insert-text

    CONTENTS
    --------

      1 ENHANCED AUTOEXEC (file in this repo)

        Added pesistent work library, so tables can persist between ultraedit program submissions.
        Added enhanced options that no longer requires &_init_
        Added handy macro variables

        Whats happening

          1 The autoexec is run everytime you submit your code in ultraedit
            Normally this deletes the work directory,

          2 The enhanced autoexec assigns am additional persistent 'work' library
            libname workx wpd "d:/wpswrkx"
            This library and all its contents will be available next time submit your code.

          3 If you want to clear the contents of 'd:/wpswrk' just run this
            proc datasets lib=workx kill;
            run;quit;

          4 all the handy macro variables are assigned.


      2 KEY MAPPING TO INSERT TEXT IN ULTRAEDIT

        Mapped the following code to keys alt + f4

         options set=RHOME "D:\d451";
         proc r;
         export data=class r=class;
         submit;
         library(sqldf)
         options(sqldf.dll = "d:/dll/sqlean.dll")
         table=sqldf('
            select
              *
            from
              class')
         print(table);
         endsubmit;
         import data=table r=table;
         run;
         quit;


    /*              _                              _              _
    / |   ___ _ __ | |__   __ _ _ __   ___ ___  __| |  __ _ _   _| |_ ___   _____  _____  ___
    | |  / _ \ `_ \| `_ \ / _` | `_ \ / __/ _ \/ _` | / _` | | | | __/ _ \ / _ \ \/ / _ \/ __|
    | | |  __/ | | | | | | (_| | | | | (_|  __/ (_| || (_| | |_| | || (_) |  __/>  <  __/ (__
    |_|  \___|_| |_|_| |_|\__,_|_| |_|\___\___|\__,_| \__,_|\__,_|\__\___/ \___/_/\_\___|\___|

    PREP

      1 Make sure you slc config file has this line

        My cobfig is at C:\wpscfg\altairslc_local,cfg

        -AUTOEXEC 'C:\wpsoto\autoexec.sas'

    NEW AUTOEXEC
    */

    ;;;;

    run;quit;

    /*----  NO LONGER NEEDED
    %let _init_= %str(
    ods _all_ close;
    ods listing;
    options ls=255 ps=65
     nofmterr nocenter
     nodate nonumber
     noquotelenmax
     validvarname=upcase
     compress=no
     FORMCHAR='|----|+|---+=|-/\<>*')
    ;
    ----*/

    ods _all_ close;
    ods listing;
    options ls=255 ps=65
     nofmterr nocenter
     nodate nonumber
     noquotelenmax
     validvarname=upcase
     nolabel
     compress=no
     FORMCHAR='|----|+|---+=|-/\<>*')
    ;

    run;quit;

    /*---- MAKE SURE PRINT OUTPUT IS CLEARED - MAY NOT BE NEEDED ----*/

    data _null_;
      file print;
      put " ";
    run;quit;

    /*---- USEFUL FOR A PERSISTENT WORK LIBRARY IN ULTRAEDIT ----*/

    libname workx wpd "d:/wpswrkx";


    *---- LETTERS ----*/

    %let lettersq=
     "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z";
    %let letters=A B C D E F G H I J K L M N O P Q R S T U V W X Y Z;
    %let letter=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz;

    /*---- NUMBERS ----*/

    %let numbersq=%str("1","2","3","4","5","6","7","8","9","10");
    %let numbers=1 2 3 4 5 6 7 8 9 10;
    %let number=12345678910;

    /*---- STATES  ----*/

    %let states50q="AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME"
    ,"MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD"
    ,"TN","TX","UT","VT","VA","WA","WV","WI","WY";

    %let states50= %sysfunc(compbl(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT
    NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)) ;

    /*---- MONTHS  ----*/

    %let monthsq="JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT", "NOV", "DEC" ;
    %let months = JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC;

    %let monthsq=%str("JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER");
    %let months=JANUARY FEBRUARY MARCH APRIL MAY JUNE JULY AUGUST SEPTEMBER OCTOBER NOVEMBER DECEMBER;

    /*---- DAYS    ----*/

    %let daysq="Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday";
    %let days=Monday Tuesday Wednesday Thursday Friday Saturday Sunday;

    %let daysabvq="Mon","Tue","Wed","Thu","Fri","Sat","Sun";
    %let daysabv=Mon Tue Wed Thu Fri Sat Sun;


    /*---- STATES LONG NAMES 50  ----*/

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

    /*___          _ _                      _ _     _                     _    _            _
    |___ \   _   _| | |_ _ __ __ _  ___  __| | |_  (_)_ __  ___  ___ _ __| |_ | |_ _____  _| |_
      __) | | | | | | __| `__/ _` |/ _ \/ _` | __| | | `_ \/ __|/ _ \ `__| __|| __/ _ \ \/ / __|
     / __/  | |_| | | |_| | | (_| |  __/ (_| | |_  | | | | \__ \  __/ |  | |_ | ||  __/>  <| |_
    |_____|  \__,_|_|\__|_|  \__,_|\___|\__,_|\__| |_|_| |_|___/\___|_|   \__| \__\___/_/\_\\__|
    */

    Place the following code in

    C:\slc\rpgm.js

    var lines = [
      'options set=RHOME "D:\\d451"; &_init_;',
      'proc r;',
      'export data=class r=class;',
      'submit;',
      'library(sqldf)',
      'options(sqldf.dll = "d:/dll/sqlean.dll")',
      'want<-sqldf(" ")',
      'endsubmit;',
      'import data=want r=want;',
      'run;quit;'
    ];

    // Write each line with Windows line endings
    for (var i = 0; i < lines.length; i++) {
        UltraEdit.activeDocument.write(lines[i] + "\r\n");
    }

    Open Ultraedit

    Advanced > all scripts > add

    go to c:/slc and select rpgm.js

    highlight 'Hotkey' cell

    hold alt hey and hit F4

    Result: Alt + F4 will insert the r code in your editor

    IMPORTANT;

    Advanced Backup Settings > enter c:/slc in 'Backup To Directory' > backup

    Close backup

    Go to very top left yellow [UE] and selecte close.

    Next time you open ultraedit

    Put focus on c:/slc/current.sas window and hot alt F4.

    The rpgm,js script will run and this will appear in you editor window

    options set=RHOME "D:\d451"; &_init_;
    proc r;
    export data=class r=class;
    submit;
    library(sqldf)
    options(sqldf.dll = "d:/dll/sqlean.dll")
    want<-sqldf(" ")
    endsubmit;
    import data=want r=want;
    run;quit;

    /*              _
      ___ _ __   __| |
     / _ \ `_ \ / _` |
    |  __/ | | | (_| |
     \___|_| |_|\__,_|

    */
