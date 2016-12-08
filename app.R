library(plotly)
library(zoo)


ui <- sidebarLayout(
  sidebarPanel(    
      selectInput("Types", label = "Select Spread Type", choices = c("Protective Put" = "PP", "Covered Call" = "CC", "Collar" = "CO", "Bull Call" = "Bull", "Bear Call" = "Bear", "Straddle" = "S", "Butterfly" = "TT" )),
      
      conditionalPanel(
        condition = "input.Types == 'PP'",
        numericInput("stockpricePP", "Buy Stock Price", value = 100, min = 0, max = 200),
        numericInput("putstrikePP", "Buy Put Option Strike", value = 90, min = 0, max = 200),
        numericInput("putpricePP", "Buy Put Option Price", value = 3, min = 0, max = 200)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'CC'",
        numericInput("stockpriceCC", "Buy Stock Price", value = 150, min = 0, max = 200),
        numericInput("callstrikeCC", "Sell Call Option Skrike", value = 160, min = 0, max = 200),
        numericInput("callpriceCC", "Sell Call Option Price", value = 2, min = 0, max = 200)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'CO'",
        numericInput("stockpriceCO", "Buy Stock Price", value = 100, min = 0, max = 200),
        numericInput("callstrikeCO", "Sell Call Option Skrike", value = 110, min = 0, max = 200),
        numericInput("callpriceCO", "Sell Call option Price", value = 3, min = 0, max = 200),
        numericInput("putstrikeCO", "Buy Put Option Skrike", value = 90, min = 0, max = 200),
        numericInput("putpriceCO", "Buy Put Option Price", value = 4, min = 0, max = 200)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'Bull'",
        numericInput("call1strikeBull", "Buy Call Option Skrike", value = 100, min = 0, max = 200),
        numericInput("call1priceBull", "Buy Call Option Price", value = 6, min = 0, max = 200),
        numericInput("call2strikeBull", "Sell Call Option Skrike", value = 110, min = 0, max = 200),
        numericInput("call2priceeBull", "Sell Call Option Price", value = 3, min = 0, max = 200)
      ),
      
      conditionalPanel(
        condition = "input.Types =='Bear'",
      
        numericInput("call1strikeBear", "Sell Call Option Skrike", value = 100, min = 0, max = 200),
        numericInput("call1priceBear", "Sell Call Option Price", value = 6, min = 0, max = 200),
        numericInput("call2strikeBear", "Buy Call Option Skrike", value = 110, min = 0, max = 200),
        numericInput("call2priceBear", "Buy Call Option Price", value = 3, min = 0, max = 200)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'S'",
        numericInput("callstrikeS", "Buy Call Option Skrike", value = 100, min = 0, max = 200),
        numericInput("callpriceS", "Buy Call Option Price", value = 3, min = 0, max = 200),
        numericInput("putstrikeS", "Buy Put Option Skrike", value = 100, min = 0, max = 200),
        numericInput("putpriceS", "Buy Put Option Price", value = 4, min = 0, max = 200)
      ),
      
      conditionalPanel(
        condition = "input.Types == 'TT'",
        
        numericInput("call1strikeTT", "Buy Call Option Skrike", value = 100, min = 0, max = 200),
        numericInput("call1priceTT", "Buy Call Option Price", value = 9, min = 0, max = 200),
        numericInput("call2strikeTT", "Sell Call Option Skrike", value = 105, min = 0, max = 200),
        numericInput("call2priceTT", "Sell Call Option Price", value = 4, min = 0, max = 200),
        numericInput("call3strikeTT", "Buy Call Option Skrike", value = 110, min = 0, max = 200),
        numericInput("call3priceTT", "Buy Call Option Price", value = 1, min = 0, max = 200)
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
    if(input$Types == "PP"){
      profitStock <- stock - input$stockpricePP
      profitOption <- ifelse(input$putstrikePP > stock, input$putstrikePP - stock, 0) - input$putpricePP
      profitPP <- profitStock + profitOption
      maxGainPP <- max(profitPP)
      maxLossPP <- min(profitPP)
      plot(profitStock, type = 'l')
      lines(profitOption)
      lines(profitPP, col = 3)
      legend('topleft', c(paste0("Max Gain = ", round(maxGainPP, 2)), paste0("Max Loss = ", round(maxLossPP, 2))))
  
      } else {
        
      if(input$Types == "CC"){
      profitStock <- stock - input$stockpriceCC
      profitOption <- ifelse(input$callstrikeCC < stock, input$callstrikeCC - stock, 0) + input$callpriceCC
      profitCC <- profitStock + profitOption
      maxGainCC <- max(profitCC)
      maxLossCC <- min(profitCC)
      plot(profitStock, type = 'l')
      lines(profitOption)
      lines(profitCC, col = 3)
      legend('topleft', c(paste0("Max Gain = ", round(maxGainCC, 2)), paste0("Max Loss = ", round(maxLossCC, 2))))
      
      } else {
        
      if(input$Types == "CO"){
      profitStock <- stock - input$stockpriceCO
      profitOption <- ifelse(input$callstrikeCO < stock, input$callstrikeCO - stock, 0) - (input$putpriceCO - input$callpriceCO)
      profitOption1 <- ifelse(input$putstrikeCO > stock, stock - input$putstikeCO, 0) + (input$putpriceCO - input$callpriceCO)
      profitCO <- profitStock + profitOption
      profit1CO <-profitStock + profitOption1
      maxGainCO <- max(profitCO)
      maxLossCO <- min(profit1CO)
      plot(profitStock, type = 'l')
      lines(profitOption)
      lines(profitCO, col = 3)
      legend('topleft', c(paste0("Max Gain = ", round(maxGainCO, 2)), paste0("Max Loss = ", round(maxLossCO, 2))))
  
      } else { 
        
      if(input$Types == "Bull"){
      profitOption <- ifelse(input$call2strikeBull > stock, input$call2strikeBull - input$call1strikeBull, 0) - (input$call2priceBull - input$call1priceBull)
      profitOption1 <- ifelse(input$call1strikeBull < stock, input$call1strikeBull - input$call2strikeBull, 0) - (input$call1priceBull - input$call2priceBull)
      profitBull <- profitOption + profitOption1
      maxGainBull <- max(profitBull)
      maxLossBull <- min(profitBull)
    
      lines(profitOption)
      lines(profitPP, col = 3)
      legend('topleft', c(paste0("Max Gain = ", round(maxGainBull, 2)), paste0("Max Loss = ", round(maxLossBull, 2))))
      
      } else {
        
      if(input$Types == "Bear"){
        profitOption <- ifelse(input$call2strikeBear > input$cal1strikeBear, input$call2strikeBear - input$call1strikeBear, 0) - (input$call2priceBear - input$call1priceBear)
        profitOption1 <- ifelse(input$call1strikeBear < input$call2strikeBear, input$call1strikeBear - input$call2strikeBear, 0) - (input$call1priceBear - input$call2priceBear)
        profitBear <- profitOption + profitOption1
        maxGainBear <- min(profitBear)
        maxLossBear <- max(profitBear)
        plot(profitStock, type = 'l')
        lines(profitOption)
        lines(profitPP, col = 3)
        legend('topleft', c(paste0("Max Gain = ", round(maxGainBear, 2)), paste0("Max Loss = ", round(maxLossBear, 2))))
      
      } 
#         else {
#         
#       if(input$Types == "S"){
#         profitOption <-
#         profitOption1 <-
#         profitS <- 
#         maxGainS <-
#         maxLossS <-
#         
#         
#            }
#           }
        
        }
       }
      }  
    }
 }) 
} 
shinyApp(ui = ui, server = server)
