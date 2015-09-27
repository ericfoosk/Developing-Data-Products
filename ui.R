
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  title = "BMI & BMR Calculator",
  fluidRow(
    column(12,
    h2("BMI & BMR Calculator", align = "center"),      
  fluidRow(
    column(4,
      radioButtons("Units", label = h4("Units of Measurement"),
                   choices = list("Metric" = 1, "Imperial" = 2), 
                   selected = 1),
      radioButtons("Gender", label = h4("Gender"),
                   choices = list("Female" = 1, "Male" = 2), 
                   selected = 1)
  ),
  column(4,
     numericInput("Age", 
                  label = h4("Age (Years)"),
                  value = 0),         
     conditionalPanel(
       condition = "input.Units == 1",
       numericInput("Weight", 
                    label = h4("Weight (kg)"),
                    value = 0),
       numericInput("Height", 
                    label = h4("Height (m)"),
                    value = 0)
       ),
     conditionalPanel(
       condition = "input.Units == 2",
       numericInput("Weight", 
                    label = h4("Weight (lb)"),
                    value = 0),
       numericInput("Height", 
                    label = h4("Height (ft)"),
                    value = 0)
     )
  ),
  column(4,
     selectInput("Activity", label = h4("Activity Level"),
                  choices = list("Sedentary" = 1, 
                                 "Lightly Active" = 2,
                                 "Moderatetely Active" = 3,
                                 "Very Active" = 4,
                                 "Extra Active" = 5), 
                  selected = 1),
     actionButton("goButton", "Calculate BMI & BMR")
  )
)
)),
  fluidRow(
    column(12,
           h2("Results of BMI & BMR Calculation", align = "center"),
     fluidRow(
       column(6,
              h4("You have entered"),
              verbatimTextOutput("inputValueWeight"),
              verbatimTextOutput("inputValueHeight"),
              verbatimTextOutput("inputValueActivity")
       ),
       column(6,
           h4("Your BMI is"),
           verbatimTextOutput("predictionBMI"),
           h4("Your BMR is"),
           verbatimTextOutput("predictionBMR")
       )
     )
))))