co2_per_cap = function(country, year, file = "data/co2_emissions_tonnes_per_person_gapminder.csv"){
  data = read.csv(file)
  
  if (!(country %in% data$country)){
    stop("Not a country in dataset")
  }
  year = paste("X", as.character(year), sep = "")
  if (!(year %in% colnames(data))){
    stop("Not a year in dataset")
  }
  
  emissions = data[data$country == country, year]
  if(is.na(emissions)){
    print("No data for that year")
    return(NA)
  }

  quantiles = quantile(data[, year], c(0.1,0.2,0.3,0.4), na.rm = TRUE)
  i = match(TRUE, emissions < quantiles, nomatch = 5)
  grade = c("A","B","C","D","F")[i]
  
  print(paste("Grade:", grade))
  print(paste(as.character(emissions), "tonnes of emissions per person per year"))
  return(emissions)
}

data = read.csv("data/co2_emissions_tonnes_per_person_gapminder.csv")
