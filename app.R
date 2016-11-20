library(plotly)
library(zoo)


ui <- sidebarLayout(
  sidebarPanel(    
      selectInput("Types", label = "Select Spread Type", choices = c("Protective Put", "Covered Call", "Collar", "Bull Call", "Bear Call", "Straddle", "Butterfly")),
      
      conditionalPanel(
        condition = "input.Types == 'Protective Put'",
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'Covered Call'",
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'Collar'",
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
        condition = "input.Types == 'Bull Call'",
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.Types =='Bear Call'",
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'Straddle'",
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'Butterfly'",
        selectInput("Types","Types:", c("BUY","SELL")),
        # since a butterfly spread is buy 1 call sell 2 call then buy 1 call. 
        # how should this one be completed. 
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000),
        selectInput("Types","Types:", c("BUY","SELL")),
        selectInput("Types","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollars", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollars", "Price($)", 0, min = 0, max = 3000)
        )
      ## )
    ),
      mainPanel(
      plotOutput("thePlot")  
    )
      )
server <- function(input, output) {
  output$thePlot <- renderPlot({
    
    # Render a plot
plot(rnorm(100))

  })
}
shinyApp(ui = ui, server = server)
