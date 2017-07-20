#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

BMI_Factor<-function(Weight,Height) {Weight/(Height^2)}

diagnostic_f<-function(Weight,Height,age){
  if(age>=20)
  {
  BMI_value<-Weight/(Height^2)
  ifelse(BMI_value<16,"Severe Thinness",ifelse(BMI_value<17," Moderate Thinness",ifelse(BMI_value<18.5," Mild Thinness",ifelse(BMI_value<24.9," Normal weight",ifelse(BMI_value<29.9," Overweight", ifelse(BMI_value<35," Obese Class I",ifelse(BMI_value< 40," Obese Class II","Obese Class III")))))))
  }
  else if(age>=2 & age <20)
  {
    BMI_value<-Weight/(Height^2)
    ifelse(BMI_value<5,"Underweight",ifelse(BMI_value<85," Normal weight",ifelse(BMI_value<95,"At risk of overweight","Overweight")))
  }
}

shinyServer(
  function(input, output ) {
    
    output$inputagevalue <- renderPrint({input$age})
    output$inputweightvalue <- renderPrint({input$Weight})
    output$inputheightvalue <- renderPrint({input$Height})
    output$estimation <- renderPrint({BMI_Factor(input$Weight,input$Height)})
    output$diagnostic <- renderPrint({diagnostic_f(input$Weight,input$Height,input$age)})
  } 
)