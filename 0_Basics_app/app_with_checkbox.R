library(shiny)
library(ggplot2)

shinyApp(
    ui = fluidPage(
        checkboxInput("show_title", "Show Title", value = TRUE),
        plotOutput("plot", height = 300)
    ),
    
    server = function(input, output) {
        output$plot <- renderPlot({
            ggplot(data = diamonds, aes(x = price)) +
                geom_histogram(bins = 20, color = "black", fill = "white") +
                theme_bw() +
                if (input$show_title) ggtitle("Distribution of Diamond Prices")
        })
    }
)
