### lubridate

install.packages("lubridate")
library("lubridate")

#####  Parsing dates and times ######


ymd("20110604")
#[1] "2011-06-04"

mdy("06-04-2011")
#"2011-06-04"

dmy("04/06/2011")
#"2011-06-04"


##### Setting and Extracting information #####


arrive <- ymd_hms("2011-06-04 12:00:00", tz = "Pacific/Auckland")
#[1] "2011-06-04 12:00:00 NZST"

second(arrive)
#[1] 0

second(arrive) <- 25
arrive
#[1] "2011-06-04 12:00:25 NZST"


wday(arrive)
#[1] 7

wday(arrive, label = TRUE)
#[1] Sat
#Levels: Sun < Mon < Tue < Wed < Thu < Fri < Sat


#### Time Zones ####

meeting <- ymd_hms("2011-07-01 09:00:00", tz = "Pacific/Auckland")
with_tz(meeting, "America/Chicago")
#[1] "2011-06-30 16:00:00 CDT"



##### Time Intervals #####
arrive <- ymd_hms("2011-06-04 12:00:00", tz = "Pacific/Auckland")
leave <- ymd_hms("2011-08-10 14:00:00", tz = "Pacific/Auckland")


auckland <- interval(arrive, leave) 
auckland
#[1] 2011-06-04 12:00:00 NZST--2011-08-10 14:00:00 NZST


auckland <- arrive %--% leave
auckland
#[1] 2011-06-04 12:00:00 NZST--2011-08-10 14:00:00 NZST


jsm <- interval(ymd(20110720, tz = "Pacific/Auckland"), ymd(20110831, tz = "Pacific/Auckland"))
jsm
#[1] 2011-07-20 NZST--2011-08-31 NZST


#### Arithmetic with date times

minutes(9) ## period
#> [1] "9M 0S"
dminutes(9) ## duration
#> [1] "540s (~2 minutes)"


leap_year(2011) ## regular year
#> [1] FALSE
ymd(20110101) + dyears(1)
#> [1] "2012-01-01"
ymd(20110101) + years(1)
#> [1] "2012-01-01"

leap_year(2012) ## leap year
#> [1] TRUE
ymd(20120101) + dyears(1)
#> [1] "2012-12-31"
ymd(20120101) + years(1)
#> [1] "2013-01-01"








































