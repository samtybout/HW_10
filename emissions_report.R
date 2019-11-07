co2_per_cap = function(country, year, file){
  data = read.csv(file)
  year <- paste("X", as.character(year), sep = "")
  
  if (!(year %in% colnames(data))){
    stop("Not a year in dataset")
  }
  if (!(country %in% data$country)){
    stop("Not a country in dataset")
  }
  emissions = data[data$country == country, year]
  if(is.na(emissions)){
    print("No data for that year")
  }
  
  emissions <- data[data$country == country, year]
  quantiles <- quantile(data[,year], c(.1, .2, .3, .4), na.rm = TRUE)
  names(quantiles) <- c("A", "B", "C", "D")
  grade <- "F"
  counter = 1
  for (q in quantiles){
    if (emissions < q){
      grade <- names(quantiles[counter])
      break
    }
    counter = counter + 1
  }
  print(paste("Grade:", as.character(grade), as.character(emissions), "tonnes of emissions per person per year"))
}
