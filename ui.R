#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  titlePanel("BMI Calculation Tool"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("Height",
                  "Your Height/cm:",
                  min = 1,
                  max = 220,
                  value = 165),
      sliderInput("Weight",
                  "Your Weight/Kg:",
                  min = 1,
                  max = 200,
                  value = 50),
      submitButton("New BMI"),
      h3("Body Mass Index"),
      em("Aid for a Health Weight")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3(textOutput("resultBMI")),
      textOutput("inputs"),
      h3(textOutput("BMIRef")),
      tableOutput("BMICategories")
    )
  )
))
