library(shiny)
library(ggplot2)
Data <- LifeCycleSavings

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Variables for Life Savings"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h1("Variables"),
      sliderInput(
        "obs", 
        "Observations",
        min = 5,
        max = nrow(Data),
        value = min(5, nrow(Data)),
        step = 5 
        ),
      selectInput("x","X",names(Data)),
      selectInput("y", "Y", names(Data)),
      selectInput("color","Color",c("None",names(Data)))
      ),
    mainPanel(
      plotOutput("plot"))
    
    )
  )
)
       