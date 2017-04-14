



with(dt2, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
  colors <- c("black", "red", "blue")
  variables <- paste0("Sub_metering_", 1:3)
  
  for (i in seq_along(variables)) {
    var <- variables[i] 
    data <- dt2[[var]]
    lines(dt2$datetime, data, col=colors[i])
  }
legend("topright", legend=variables, col=colors, lty="solid" )
