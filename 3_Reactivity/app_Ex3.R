#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)


# Define UI for application that draws a histogram
ui <- fluidPage(
  # Application title
  textInput("title", "Title", value = "R-ladies members attendance to events"),
  #titlePanel("R-ladies members attendance to events"),
  
  # Sidebar with aninput for number of bins 
  sidebarLayout(
    sidebarPanel(
      # slider input for number of bins 
      # sliderInput("bins",
      #             "Number of bins:",
      #             min = 1,
      #             max = 16,
      #             value = 8)
      # numeric input for the bins
      numericInput("bins", "Bins", min = 1, max = 16, value = 8),
      selectInput("dat", label = "Select a database to display:",
                  choices = c("diamonds","meetupAttendance"), selected = "meetupAttendance")
    ),
    
    # Show a plot of the generated distribution and the table
    mainPanel(
      #h4("We are plotting here the distribution of the R-ladies members attendance to events."),
      plotOutput("distPlot"),
      # show the table output
      dataTableOutput("table")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  # Load the data of Members attendance 
  #x    <- read.table("Members_attendance.txt",header = T) 
  
  dataInput <- reactive({
    if(input$dat  %in% "meetupAttendance") {x <- read.table("Members_attendance.txt",header = T)}
    if(input$dat %in% "diamonds") {x <- diamonds}
    return(x)
  })
  
  
  
  output$distPlot <- renderPlot({
    #generate bins based on input$bins from ui.R
    
    x <- read.table("Members_attendance.txt",header = T) 
    Meetups_attended=x$Meetups_attended
    bins <- seq(min(Meetups_attended), max(Meetups_attended), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(Meetups_attended, breaks = bins, col = 'blue', border = 'lightblue')
    
  })
  
  output$table <- renderDataTable({
    # ouput the datatable
    #return(x)
    dataInput()
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

