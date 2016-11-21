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
        selectInput("TypesA3","Types:", c("BUY","SELL")),
        selectInput("TypesB3","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsA3", "Price($)", 0, min = 0, max = 3000),
        selectInput("TypesC3","Types:", c("BUY","SELL")),
        selectInput("TypesD3","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsB3", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollarsC3", "Price($)", 0, min = 0, max = 3000),
        selectInput("TypesE3","Types:", c("BUY","SELL")),
        selectInput("TypesF3","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsE3", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollarsF3", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'Bull Call'",
        selectInput("TypesA4","Types:", c("BUY","SELL")),
        selectInput("TypesB4","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsA4", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollarB4s", "Price($)", 0, min = 0, max = 3000),
        selectInput("TypesC4","Types:", c("BUY","SELL")),
        selectInput("TypesD4","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsC4", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollarsD4", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.Types =='Bear Call'",
        selectInput("TypesA5","Types:", c("BUY","SELL")),
        selectInput("TypesB5","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsA5", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollarsB5", "Price($)", 0, min = 0, max = 3000),
        selectInput("TypesC5","Types:", c("BUY","SELL")),
        selectInput("TypesD5","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsC5", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollarsD5", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'Straddle'",
        selectInput("TypesA6","Types:", c("BUY","SELL")),
        selectInput("TypesB6","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsA6", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollarsB6", "Price($)", 0, min = 0, max = 3000),
        selectInput("TypesC6","Types:", c("BUY","SELL")),
        selectInput("TypesD6","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsC6", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollarsD6", "Price($)", 0, min = 0, max = 3000)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'Butterfly'",
        selectInput("TypesA7","Types:", c("BUY","SELL")),
        # since a butterfly spread is buy 1 call sell 2 call then buy 1 call. 
        # how should this one be completed. 
        selectInput("TypesB7","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsA7", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollarsB7", "Price($)", 0, min = 0, max = 3000),
        selectInput("TypesC7","Types:", c("BUY","SELL")),
        selectInput("TypesD7","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsC7", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollarsD7", "Price($)", 0, min = 0, max = 3000),
        selectInput("TypesE7","Types:", c("BUY","SELL")),
        selectInput("TypesF7","Types:", c("CALL","PUT","STOCK")),
        numericInput("dollarsE7", "Skrike($)", 0, min = 0, max = 3000),
        numericInput("dollarsF7", "Price($)", 0, min = 0, max = 3000)
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
