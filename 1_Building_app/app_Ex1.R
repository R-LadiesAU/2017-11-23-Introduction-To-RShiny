#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("R-ladies members attendance to events"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 16,
                     value = 8)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        #h4("We are plotting here the distribution of the R-ladies members attendance to events."),
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- read.table("~/WEHI/R_ladies/Rshiny_tutorial/Building_a_shiny_app/1_Building_app/Members_attendance.txt",header = T) 
      Meetups_attended=x$Meetups_attended
      bins <- seq(min(Meetups_attended), max(Meetups_attended), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(Meetups_attended, breaks = bins, col = 'blue', border = 'lightblue')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

