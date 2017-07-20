#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny) 
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Body Mass Index (BMI) Calculator for Adults and Kids"),
    
    sidebarPanel(
      numericInput('age', 'Insert your age', 25, min=2),
      numericInput('Weight', 'Insert your weight in kilograms', 60) ,
      numericInput('Height', 'Insert your height in meters', 1.70, min = 0.4, max = 2.2, step = 0.01)
    ), 
    mainPanel(
      p('Body mass index (BMI) is a measure of body fat based on height and weight.
        The Body Mass Index (BMI) Calculator can be used to calculate your BMI value and weight status while taking your age into consideration'),
      h4('BMI Table for Adults'),
      p(' This is the World Health Organization (who) recommended body weight based on BMI values for adults. It is used for both men and women, age 18 or older:'),
      tags$div(
        tags$ul(
          tags$li('BMI <16       : Severe Thinness'),
          tags$li('BMI <[16-17]      : Moderate Thinness'),
          tags$li('BMI <[17-18.5]      : Mild Thinness'),
          tags$li('BMI [18.5-24.9] : Normal weight'),
          tags$li('BMI [25-29.9]   : Overweight'),
          tags$li('BMI >=[30-35]        : Obese Class I'),
          tags$li('BMI >=[35-40        : Obese Class II'),
          tags$li('BMI >=40        : Obese Class III')
        )
      ),
      h4('BMI Table for Children and Teens, Age 2-20'), 
      p(' The Centers for Disease Control and Prevention (CDC) recommends BMI categorization for children and teens between age 2 and 20.'),
      tags$div(
        tags$ul(
          tags$li('BMI <5%       : Underweight'),
          tags$li('BMI [5%-85%] : Normal weight'),
          tags$li('BMI [85%-95%]   : At risk of overweight'),
          tags$li('BMI >=95%        : Overweight')
        )
      ),
      
      h4('Calulating your BMI with your entry'), 
      p('age:'), verbatimTextOutput("inputagevalue"),
      p('weight:'), verbatimTextOutput("inputweightvalue"),
      p('height:'), verbatimTextOutput("inputheightvalue"),
      h4('Your calulated BMI is:'),
      verbatimTextOutput("estimation"),
      p('It means that you are:'),strong(verbatimTextOutput("diagnostic"))
      
      
    )
    
  )   
)