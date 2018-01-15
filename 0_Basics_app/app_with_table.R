library(shiny)
library(ggplot2)

shinyApp(
    ui = fluidPage(
        tableOutput("table")
    ),
    
    server = function(input, output) {
        output$table <- renderTable({
            return(head(diamonds, n = 8))
        })
    }
)
