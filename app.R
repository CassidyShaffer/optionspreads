library(plotly)
library(zoo)


ui <- sidebarLayout(
  sidebarPanel(    
      selectInput("Types", label = "Select Spread Type", choices = c("Protective Put", "Covered Call", "Collar", "Bull Call", "Bear Call", "Straddle", "Butterfly")),
      
      conditionalPanel(
        condition = "input.Types == 'Protective Put'",
        numericInput("dollarsA1", "Buy Stock Price($)", value = 100, min = 0, max = 200),
        numericInput("dollarsB1", "Buy Put Option Strike($)", value = 90, min = 0, max = 200),
        numericInput("dollarsC1", "Buy Put Option Price($)", value = 3, min = 0, max = 200)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'Covered Call'",
        numericInput("dollarsA2", "Buy Stock Price($)", value = 150, min = 0, max = 200),
        numericInput("dollarsB2", "Sell Call Option Skrike($)", value = 160, min = 0, max = 200),
        numericInput("dollarsC2", "Sell Call Option Price($)", value = 2, min = 0, max = 200)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'Collar'",
        numericInput("dollarsA3", "Buy Stock Price($)", value = 100, min = 0, max = 200),
        numericInput("dollarsB3", "Sell Call Option Skrike($)", value = 110, min = 0, max = 200),
        numericInput("dollarsC3", "Sell Call option Price($)", value = 3, min = 0, max = 200),
        numericInput("dollarsD3", "Buy Put Option Skrike($)", value = 90, min = 0, max = 200),
        numericInput("dollarsE3", "Buy Put Option Price($)", value = 4, min = 0, max = 200)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'Bull Call'",
        numericInput("dollarsA4", "Buy Call Option Skrike($)", value = 100, min = 0, max = 200),
        numericInput("dollarsB4", "Buy Call Option Price($)", value = 6, min = 0, max = 200),
        numericInput("dollarsC4", "Sell Call Option Skrike($)", value = 110, min = 0, max = 200),
        numericInput("dollarsD4", "Sell Call Option Price($)", value = 3, min = 0, max = 200)
      ),
      
      conditionalPanel(
        condition = "input.Types =='Bear Call'",
      
        numericInput("dollarsA5", "Sell Call Option Skrike($)", value = 100, min = 0, max = 200),
        numericInput("dollarsB5", "Sell Call Option Price($)", value = 6, min = 0, max = 200),
        numericInput("dollarsC5", "Buy Call Option Skrike($)", value = 110, min = 0, max = 200),
        numericInput("dollarsD5", "Buy Call Option Price($)", value = 3, min = 0, max = 200)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'Straddle'",
        numericInput("dollarsA6", "Buy Call Option Skrike($)", value = 100, min = 0, max = 200),
        numericInput("dollarsB6", "Buy Call Option Price($)", value = 3, min = 0, max = 200),
        numericInput("dollarsC6", "Buy Put Option Skrike($)", value = 100, min = 0, max = 200),
        numericInput("dollarsD6", "Buy Put Option Price($)", value = 4, min = 0, max = 200)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'Butterfly'",
        
        numericInput("dollarsA7", "Buy Call Option Skrike($)", value = 100, min = 0, max = 200),
        numericInput("dollarsB7", "Buy Call Option Price($)", value = 9, min = 0, max = 200),
        numericInput("dollarsC7", "Sell Call Option Skrike($)", value = 105, min = 0, max = 200),
        numericInput("dollarsD7", "Sell Call Option Price($)", value = 4, min = 0, max = 200),
        numericInput("dollarsE7", "Buy Call Option Skrike($)", value = 110, min = 0, max = 200),
        numericInput("dollarsF7", "Buy Call Option Price($)", value = 1, min = 0, max = 200)
        )
      ## )
    ),
      mainPanel(
      plotOutput("thePlot")  
    )
      )
server <- function(input, output) {
  output$thePlot <- renderPlot({
      stock <- 0:200
      profitStock <- stock - input$dollarsA1
      profitOption <- ifelse(input$dollarsB1 > stock, input$dollarsB1 - stock, 0) - input$dollarsC1
      profitPP <- profitStock + profitOption
      maxGainPP <- max(profitPP)
      maxLossPP <- min(profitPP)
      plot(profitStock, type = 'l')
      lines(profitOption)
      lines(profitPP, col = 3)
      legend('topleft', c(paste0("Max Gain = ", round(maxGainPP, 2)), paste0("Max Loss = ", round(maxLossPP, 2))))
      
      stock <- 0:200
      profitStock <- stock - input$dollarsA2
      profitOption <- ifelse(input$dollarsB2 < stock, input$dollarsB2 - stock, 0) + input$dollarsC2
      profitPP <- profitStock + profitOption
      maxGainPP <- max(profitPP)
      maxLossPP <- min(profitPP)
      plot(profitStock, type = 'l')
      lines(profitOption)
      lines(profitPP, col = 3)
      legend('topleft', c(paste0("Max Gain = ", round(maxGainPP, 2)), paste0("Max Loss = ", round(maxLossPP, 2))))
      
      stock <- 0:200
      profitStock <- stock - input$dollarsA3
      profitOption <- ifelse(input$dollarsB3 < stock, input$dollarsB3 - stock, 0) - (input$dollarsE3 - input$dollarsC3)
#       profitOption <- ifelse(input$dollarsC3 > stock, input$dollarsC3 - stock, 0) - (input$dollarsC3 - input$dollarsE3)
      profitPP <- profitStock + profitOption
      maxGainPP <- max(profitPP)
      maxLossPP <- min(profitPP)
      plot(profitStock, type = 'l')
      lines(profitOption)
      lines(profitPP, col = 3)
      legend('topleft', c(paste0("Max Gain = ", round(maxGainPP, 2)), paste0("Max Loss = ", round(maxLossPP, 2))))
      
      stock <- 0:200
      profitOption <- ifelse(input$dollarsC4 > stock, input$dollarsC4 - input$dollarsA4, 0) - (input$dollarsD4-input$dollarsB4)
      profitPP <- profitStock + profitOption
      maxGainPP <- max(profitPP)
      maxLossPP <- min(profitPP)
      plot(profitStock, type = 'l')
      lines(profitOption)
      lines(profitPP, col = 3)
      legend('topleft', c(paste0("Max Gain = ", round(maxGainPP, 2)), paste0("Max Loss = ", round(maxLossPP, 2))))
      
      
 }) 
} 
shinyApp(ui = ui, server = server)
