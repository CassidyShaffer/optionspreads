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
        selectInput("Types1","Types:", c("BUY","SELL")),
        selectInput("Types1","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars1", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types2","Types:", c("BUY","SELL")),
        selectInput("Types2","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars2", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars2", "Price($)", 0, min = 0, max = 3000),
        ),
      
      conditionalPanel(
        condition = "input.type == 'Covered Call'",
        selectInput("Types1","Types:", c("BUY","SELL")),
        selectInput("Types1","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars1", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types2","Types:", c("BUY","SELL")),
        selectInput("Types2","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars2", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars2", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.type == 'Collar'",
        selectInput("Types1","Types:", c("BUY","SELL")),
        selectInput("Types1","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars1", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types2","Types:", c("BUY","SELL")),
        selectInput("Types2","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars2", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars2", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types3","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars3", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars3", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.type == 'Bull Call'",
        selectInput("Types1","Types:", c("BUY","SELL")),
        selectInput("Types1","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars1", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars1", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types2","Types:", c("BUY","SELL")),
        selectInput("Types2","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars2", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars2", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.type =='Bear Call'",
        selectInput("Types1","Types:", c("BUY","SELL")),
        selectInput("Types1","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars1", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars1", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types2","Types:", c("BUY","SELL")),
        selectInput("Types2","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars2", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars2", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.type == 'Straddle'",
        selectInput("Types1","Types:", c("BUY","SELL")),
        selectInput("Types1","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars1", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars1", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types2","Types:", c("BUY","SELL")),
        selectInput("Types2","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars2", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars2", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.type == 'Butterfly'",
        selectInput("Types1","Types:", c("BUY","SELL")),
        # since a butterfly spread is buy 1 call sell 2 call then buy 1 call. 
        # how should this one be completed. 
        selectInput("Types1","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars1", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars1", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types2","Types:", c("BUY","SELL")),
        selectInput("Types2","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars2", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars2", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types3","Types:", c("BUY","SELL")),
        selectInput("Types3","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars3", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars3", "Price($)", 0, min = 0, max = 3000)
      )
      
      
      
    )))

   

server <- function(input, output) 
  
  mainPanel(
    renderPlot(
      if(input$type == "Protective Put")
    )
  )
    
shinyApp(ui = ui, server = server)
