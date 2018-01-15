library(shiny)
library(ggplot2)

shinyApp(
    ui = navbarPage(
        tabPanel("Tab0"
                 #dataTableOutput("table")
        ),
        tabPanel("Tab1",
                 dataTableOutput("table")
        ),
        tabPanel("Tab2",
                 plotOutput("plot", height = 350)
        ),
        tabPanel("Tab3")
    ),
    
    server = function(input, output) {
        output$table <- renderDataTable({
            return(head(diamonds, n = 5))
        })
        output$plot <- renderPlot({
            ggplot(data = diamonds, aes(x = price)) +
                geom_histogram(bins = 20, color = "black", fill = "white") +
                theme_bw() +
                ggtitle("Distribution of Diamond Prices")
        })
    }
)
