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

    # Application title
    titlePanel("Predict Black Cherry Tree's Volumn from it's Girth and Height"),

    # Sidebar with a slider input for Girth and Height of the tree
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderGirth", "What is the Girth of the tree?",1,30,value=15),
            sliderInput("sliderHeight", "What is the Height of the tree?",1,100,value=50),
            submitButton("Submit")
        ),

        # Show a plot of the generated distribution and prediction
        mainPanel(
            plotOutput("plot"),
            h3("Predicted volume of the tree:"),
            textOutput("pred1"),
        )
    )
))
