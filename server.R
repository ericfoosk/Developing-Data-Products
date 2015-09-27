
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

activityChoices <- list("Sedentary" = 1, 
                        "Lightly Active" = 2,
                        "Moderatetely Active" = 3,
                        "Very Active" = 4,
                        "Extra Active" = 5)

shinyServer(function(input, output) {

  output$inputValueWeight <- renderText(
    if (input$Units == 1) {
      paste("Weight (kg): ", input$Weight)
    } else {
      paste("Weight (lb): ", input$Weight)
    }
  )

  output$inputValueHeight <- renderText(
    if (input$Units == 1) {
      paste("Weight (m): ", input$Height)
    } else {
      paste("Weight (ft): ", input$Height)
    }
  )
  
  output$inputValueActivity <- renderText(paste("Activity Level: ", 
                                                names(activityChoices[activityChoices == input$Activity])))
  
  output$predictionBMI <- renderText({
    if (input$Weight > 0 & input$Height > 0) {
      if (input$Units == 1) {
        bmi = input$Weight / (input$Height * input$Height) 
      } else {
        bmi = (input$Weight / ((input$Height * 12) * (input$Height * 12))) * 703
      }
    } else {
      bmi = 0
    }
    round(bmi, digits = 2)
  })
  
  output$predictionBMR <- renderText({
    if (input$Weight > 0 & input$Height > 0 & input$Age > 0) {
      if (input$Units == 1 & input$Gender == 1) {
        bmr = 655 + (9.6 * input$Weight) + (1.8 * input$Height * 100) - (4.7 * input$Age)
      } else if (input$Units == 1 & input$Gender == 2)  {
        bmr = 66 + (13.7 * input$Weight) + (5 * input$Height * 100) - (6.8 * input$Age)
      } else if (input$Units == 2 & input$Gender == 1)  {
        bmr = 655 + (4.35 * input$Weight) + (4.7 * input$Height * 12) - (4.7 * input$Age)
      } else if (input$Units == 2 & input$Gender == 2)  {
        bmr = 66 + (6.23 * input$Weight) + (12.7 * input$Height * 12) - (6.8 * input$Age)
      }
    } else {
      bmr = 0
    }
    
    if (input$Activity == 1) {
      bmr = bmr * 1.2
    } else if (input$Activity == 2) {
      bmr = bmr * 1.375
    } else if (input$Activity == 3) {
      bmr = bmr * 1.55
    } else if (input$Activity == 4) {
      bmr = bmr * 1.725
    } else {
      bmr = bmr * 1.9
    } 
    paste(round(bmr, digits = 0), "calories")
  })
  }
)  

