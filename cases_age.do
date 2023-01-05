cd "/Users/xuancy/Documents/uni/3 data science/portfolio/project"

*import csv files into Stata and save as dta files
save "cases_age.dta", replace

save "median_age.dta", replace
rename regionsubregioncountryorarea country
save "median_age.dta", replace

use "median_age.dta", clear

use "cases_age.dta", clear

*merge mediun age data to file of cumulative covid cases
merge m:1 country using "median_age.dta",keep (match master)

rename medianageasof1julyyears median_age

save "cases_age.dta", replace
