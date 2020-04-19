# U.S. Department of Labor
# Bureau of Labor Statistics 
# Quarterly Census of Employment and Wages
# June 2016
#  
# QCEW Open Data Access RScript Example
#
# R Language 3.1.0 
#
# The three functions defined in this file are called at the bottom 
# of this script. So, if you run this code, you'll get some results.
#
# Submit questions at: http://www.bls.gov/cgi-bin/forms/cew?/cew/home.htm 
#
# ******************************************************************************************



# ******************************************************************************************
# qcewGetAreaData : This function takes a year, quarter, and area argument and
# returns an array containing the associated area data. use 'a' for annual
# averages. 
# For all area codes and titles see:
# http://data.bls.gov/cew/doc/titles/area/area_titles.htm

qcewGetAreaData <- function(year, qtr, area) {
	url <- "http://data.bls.gov/cew/data/api/YEAR/QTR/area/AREA.csv"
	url <- sub("YEAR", year, url, ignore.case=FALSE)
	url <- sub("QTR", tolower(qtr), url, ignore.case=FALSE)
	url <- sub("AREA", toupper(area), url, ignore.case=FALSE)
	read.csv(url, header = TRUE, sep = ",", quote="\"", dec=".", na.strings=" ", skip=0)
}

# ******************************************************************************************




# ******************************************************************************************
# qcewGetIndustryData : This function takes a year, quarter, and industry code
# and returns an array containing the associated industry data. Use 'a' for 
# annual averages. Some industry codes contain hyphens. The CSV files use
# underscores instead of hyphens. So 31-33 becomes 31_33. 
# For all industry codes and titles see:
# http://data.bls.gov/cew/doc/titles/industry/industry_titles.htm

qcewGetIndustryData <- function (year, qtr, industry) {
	url <- "http://data.bls.gov/cew/data/api/YEAR/QTR/industry/INDUSTRY.csv"
	url <- sub("YEAR", year, url, ignore.case=FALSE)
	url <- sub("QTR", tolower(qtr), url, ignore.case=FALSE)
	url <- sub("INDUSTRY", industry, url, ignore.case=FALSE)
	read.csv(url, header = TRUE, sep = ",", quote="\"", dec=".", na.strings=" ", skip=0)
}

# ******************************************************************************************




# ******************************************************************************************
# qcewGetSizeData : This function takes a year and establishment size class code
# and returns an array containing the associated size data. Size data
# is only available for the first quarter of each year.
# For all establishment size classes and titles see:
# http://data.bls.gov/cew/doc/titles/size/size_titles.htm

qcewGetSizeData <- function ( year, size) {
	url <- "http://data.bls.gov/cew/data/api/YEAR/1/size/SIZE.csv"
	url <- sub("YEAR", year, url, ignore.case=FALSE)
	url <- sub("SIZE", size, url, ignore.case=FALSE)
	read.csv(url, header = TRUE, sep = ",", quote="\"", dec=".", na.strings=" ", skip=0)
}

# ******************************************************************************************




# EXAMPLES ----------------------------------------------------

 MichiganData <- qcewGetAreaData("2015", "1", "26000")
 Construction <- qcewGetIndustryData("2015", "1", "1012")
 SizeData <- qcewGetSizeData("2015","6")


 # Prints first line of data
MichiganData[1, ]
Construction[1, ]
SizeData[1, ]



