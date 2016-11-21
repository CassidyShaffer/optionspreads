library(plotly)
library(zoo)


ui <- sidebarLayout(
  sidebarPanel(    
      selectInput("Types", label = "Select Spread Type", choices = c("Protective Put", "Covered Call", "Collar", "Bull Call", "Bear Call", "Straddle", "Butterfly")),
      
      conditionalPanel(
        condition = "input.Types == 'Protective Put'",
        selectInput("TypesA1","Types:", c("BUY","SELL")),
        selectInput("TypesB1","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsA1", "Price($)", 0, min = 0, max = 3000),
        selectInput("TypesC1","Types:", c("BUY","SELL")),
        selectInput("TypesD1","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsB1", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollarsC1", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'Covered Call'",
        selectInput("TypesA2","Types:", c("BUY","SELL")),
        selectInput("TypesB2","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsA2", "Price($)", 0, min = 0, max = 3000),
        selectInput("TypesC2","Types:", c("BUY","SELL")),
        selectInput("TypesD2","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsB2", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollarsC2", "Price($)", 0, min = 0, max = 3000)
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
