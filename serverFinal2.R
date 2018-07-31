library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  Data <- reactive({
    LifeCycleSavings[sample(nrow(LifeCycleSavings),input$obs),]
  })
   
  output$plot <- reactivePlot(function(){
    a <- ggplot(Data(),
                aes_string(x=input$x, y=input$y)) + geom_point()
    if (input$color != "None")
      a <- a +
        aes_string(color = input$color)
    print(a)
  }, height = 500)
})
