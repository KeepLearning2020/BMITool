#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
    
  output$resultBMI <- renderText({
    curBMI <- input$Weight / ((input$Height/100)^2)
    curBMI <- round(curBMI, 2)
    paste("Your BMI: ", curBMI, " kg/m^2")
    })
    
  output$inputs <- renderText({
    paste("from your input: Height=", input$Height, "cm, Weight=", input$Weight, "Kg")
    })
  
  output$BMIRef <- renderText({
    paste("BMI vs Weight")
  })
  
  output$BMICategories <- renderTable({
    BMICategories <- matrix(
      c("Under weight", "<=18.5",
        "Normal Weight", "18.5 ~ 24.9",
        "Over Weight", "25 ~ 29.9",
        "Obesity", ">=30"), 
      nrow=4, ncol=2, byrow=TRUE,
      dimnames=list(c("type1", "type2", "type3", "type4"), c("BMI Categories", "Range"))) 
    
    head(BMICategories, 4)  
  })
  
})
