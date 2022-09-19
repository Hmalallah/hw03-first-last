#load package
library(readxl)
library(dplyr)
library(readr)
#load data
gb <- read_excel("data/raw/greenbook.xlsx")

View(gb)
glimpse(gb)

#remove the first 5 rows
gb1 <- read_excel("data/raw/greenbook.xlsx", skip=5)
glimpse(gb1)

#select away columns that I don't need (e.g. values in current US$, funding agency,
# publication row)
gb2 <- select(gb1, -"Publication Row", -"Funding Agency", -"Obligations (Historical Dollars)")
glimpse(gb2)

#renaming columns 
gb3 <- rename(gb2, year = "Fiscal Year", region = "Region", country = "Country",
              assistance_category = "Assistance Category", funding_account_name = 
                "Funding Account Name", dollars_aid = "Obligations (Constant Dollars)")
glimpse(gb3)  

#check class of each variable. 
summary(gb3)

#log transforming the dollars_aid variable using mutate. 
#dealing with the negative values for dollars_aid. 
gb4 <- mutate(gb3, log_dollars_aid = if_else(dollars_aid < 0, -log(abs(dollars_aid + 1)), 
                                             log(dollars_aid +1)))

#saving the dataset.

write_rds(gb3, "data/greenbook_tidy.rds")
write_csv(gb3, "data/greenbook_tidy.cvs")



                                    
                 

