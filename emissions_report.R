co2_per_cap = function(country, year, file = "data/co2_emissions_tonnes_per_person_gapminder.csv"){
  data = read.csv(file)
  year = paste("X", as.character(year), sep = "")
  emissions = data[data$country == country, year]
  return(emissions)
}