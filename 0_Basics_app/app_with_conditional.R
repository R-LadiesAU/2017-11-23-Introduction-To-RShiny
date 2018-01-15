library(shiny)
library(ggplot2)

shinyApp(
    ui = fluidPage(
        sliderInput("bins", "Bins", min = 1, max = 20, value = 10),
        conditionalPanel(condition = "input.bins < 10",
                         helpText("Using less than 10 bins is not recommended for this data.")
        ),
        plotOutput("plot", height = 200)
    ),
    
    server = function(input, output) {
        output$plot <- renderPlot({
            ggplot(data = diamonds, aes(x = price)) +
                geom_histogram(bins = input$bins, color = "black", fill = "white") +
                theme_bw() +
                ggtitle("Distribution of Diamond Prices")
        })
    }
)
