library(shiny)
library(ggplot2)

shinyApp(
    ui = fluidPage(
        textOutput("text")
    ),
    
    server = function(input, output) {
        output$text <- renderText({
            return(paste("The first values are ",head(diamonds$carat, n = 100),sep=""))
        })
    }
)
