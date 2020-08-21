#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(scatterplot3d)

# Define server logic required to draw a 3D plot and show prediction
shinyServer(function(input, output) {
    
    mod <- lm(Volume ~ Girth + Height, data=trees)
    
    modelPred <- reactive({
        GirthInput <- input$sliderGirth
        HeightInput <- input$sliderHeight
        predict(mod, newdata=data.frame(Girth = GirthInput, Height=HeightInput))
    })

    output$plot <- renderPlot({

        GirthInput <- input$sliderGirth
        HeightInput <- input$sliderHeight
        
        s3d <- scatterplot3d(trees, type="h", color="blue", angle=55, pch=16)
        s3d$plane3d(mod)
        s3d$points3d(x=GirthInput,y=HeightInput,z=modelPred(), col = "red", type = "h", pch = 8)
        
    })
    
    output$pred1 <- renderText({modelPred()})
    
})
