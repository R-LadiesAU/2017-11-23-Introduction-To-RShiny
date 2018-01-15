library(shiny)
library(ggplot2)

shinyApp(
    ui = fluidPage(
        textInput("title", "Title", value = "Distribution of Diamond Prices"),
        plotOutput("plot", height = 300)
    ),
    
    server = function(input, output) {
        output$plot <- renderPlot({
            ggplot(data = diamonds, aes(x = price)) +
                geom_histogram(bins = 20, color = "black", fill = "white") +
                theme_bw() +
                ggtitle(input$title)
        })
    }
)
