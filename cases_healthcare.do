cd "/Users/xuancy/Documents/uni/3 data science/portfolio/project"

*import csv files into Stata and save as dta files
save "health_ppp.dta", replace
rename countryname country
save "health_ppp.dta", replace

use "health_ppp.dta", clear

*merge mediun age data to file of cumulative covid cases
use "cases_age.dta", clear
drop _merge
merge m:1 country using "health_ppp.dta",keep (match master)

rename currenthealthexpenditurepercapit health_ppp

save "health_ppp.dta", replace

*drop data not needed and export as csv
drop v4 gdp population cumulative_deaths_2022 log_cum_case log_population log_gdp log_cum_deaths median_age _merge
drop cumulative_cases_2022
