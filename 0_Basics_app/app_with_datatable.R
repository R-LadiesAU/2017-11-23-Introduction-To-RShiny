library(shiny)
library(ggplot2)

shinyApp(
    ui = fluidPage(
        dataTableOutput("table")
    ),
    
    server = function(input, output) {
        output$table <- renderDataTable({
            return(head(diamonds, n = 8))
        })
    }
)
