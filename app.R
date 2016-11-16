library(plotly)
library(zoo)

ui <- fluidPage(

    titlePanel("Option Pricing")
)
sidebarLayout(
  sidebarPanel(    
    inputPanel(
      selectInput("Types", label = "Select Spread Type", choices = c("Protective Put", "Covered Call", "Collar", "Bull Call", "Bear Call", "Straddle", "Butterfly")),
      
      conditionalPanel(
        condition = "input.type == 'Protective Put'",
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.type == 'Covered Call'",
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.type == 'Collar'",
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.type == 'Bull Call'",
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000)
      )
      
      
      
    )))

   mainPanel(
     renderPlot(
       if(input$type == "Protective Put")
     )
   )

server <- function(input, output) 
  

    
shinyApp(ui = ui, server = server)
