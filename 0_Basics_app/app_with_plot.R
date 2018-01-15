library(shiny)
library(ggplot2)

shinyApp(
    ui = fluidPage(
        plotOutput("plot", height = 300)
    ),
    
    server = function(input, output) {
        output$plot <- renderPlot({
            ggplot(data = diamonds, aes_string(x = "price")) +
                geom_histogram(bins = 20, color = "black", fill = "white") +
                theme_bw() +
                ggtitle(paste("Distribution of Diamond", input$var))
        })
    }
)
