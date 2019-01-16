library("dplyr")
dat <-  read.csv("Data/gapminder_data.csv")

####using dplyr for data subsetting------
#filter chooses the rows
filter(dat, continent == "Americas")
filter(dat,year >2000)
dat_2 <- filter(dat, continent == "Americas", year > 2000)


## select chooses the columns
select(dat,continent)
select(dat_2, country, year, gdpPercap)

#%>% is the pipe that works the same as in the unix shell command shift m for the pipe
dat %>% 
  filter(continent == "Americas", year > 2000) %>% 
  select (country,year, gdpPercap)
 ##### group _by()  and summarize()------
summary1 <- dat %>%
  group_by(country) %>% 
  summarise(avg_life_Exp=mean(lifeExp))

####challenge Question 
#1. COMPUTE THE AVERAGE GDPPERCAP FOR EACH COUNTRY
summary2 <- dat %>%
  group_by(country) %>% 
  summarise(avg_gdpPercap=mean(gdpPercap))
#Compute the avera gdpPercap for each continet in year 1957
summary3 <- dat %>%
  group_by(continent) %>% 
  filter(year == 1957) %>% 
  summarise(avg_gdpPercap=mean(gdpPercap))

#### multiple summuru outputs -----
dat %>%
  group_by(continent) %>% 
  summarise(min_gdp)=min(gdpPercap)
max_gdp=max(gdpPercap)
####making new colum variable---
 dat %>%
   mutate(gdp_billion=gdpPercap * 10^9)
                        

 
 ######## wide vs long in gapminder data -----
 dat2 <- dat %>%
   select(country,year, gdpPercap)

 dat2_long <- dat2_wide %>% 
   gather(year, gdp, "1952":"2007")
                                      
              







