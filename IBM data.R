# =====================
# INSTALL PACKAGES 
# =====================
 install.packages("rvest")
 install.packages("tidyverse")
 install.packages("lubridate")
 install.packages("quantmod")
 install.packages("shiny")
 install.packages("igraph")
 install.packages("visNetwork")
 install.packages("ggplot2")
 install.packages("plotly")

# =====================
# LOAD LIBRARIES
# =====================
library(quantmod)
library(ggplot2)
library(visNetwork)
library(shiny)

# =====================
# STOCK DATA (IBM)
# =====================
getSymbols("IBM", from = "2022-01-01", to = "2024-12-31", src = "yahoo")

# Convert to dataframe
ibm_df <- data.frame(Date = index(IBM), coredata(IBM))
colnames(ibm_df) <- c("Date", "Open", "High", "Low", "Close", "Volume", "Adjusted")

str(ibm_df)

# Plot stock data
ggplot(ibm_df, aes(x = Date, y = Adjusted)) +
  geom_line(color = "steelblue", size = 1.2) +
  labs(title = "IBM Adjusted Stock Price (2022-2024)",
       y = "Price (USD)", x = "Date") +
  theme_minimal()

# =====================
# VISNETWORK DIAGRAM
# =====================
nodes <- data.frame(
  id = c("1_MEAR", "2_CCOM", "3_INRA", "4_STDR", "5_INPA", "6_LAYO", "7_STPI"),
  label = c("MEAR", "CCOM", "INRA", "STDR", "INPA", "LAYO", "STPI"),
  title = c("Missed Earnings", "Cloud Competition", "Interest Rate Hike", 
            "Stock Drop", "Investor Panic", "Layoffs", "Strategic Pivot"),
  color = c("#FF7F50", "#20B2AA", "#6A5ACD", "#DC143C", "#FFD700", "#40E0D0", "#9370DB")
)

edges <- data.frame(
  from = c("1_MEAR", "2_CCOM", "3_INRA", "4_STDR", "4_STDR", "5_INPA"),
  to   = c("4_STDR", "4_STDR", "4_STDR", "5_INPA", "6_LAYO", "7_STPI"),
  arrows = "to",
  color = "#555555"
)

visNetwork(nodes, edges, height = "600px", width = "100%") %>%
  visNodes(shape = "dot", scaling = list(min = 10, max = 30),
           font = list(size = 20, face = "Arial")) %>%
  visEdges(smooth = TRUE) %>%
  visOptions(highlightNearest = TRUE, nodesIdSelection = TRUE) %>%
  visInteraction(navigationButtons = TRUE) %>%
  visLayout(randomSeed = 42)

# =====================
# SHINY APP
# =====================
ui <- fluidPage(
  titlePanel("Node-Link Visualization: Tech Stock Crisis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Visualizing the chain reaction behind tech stock crashes."),
      hr(),
      p("Each node represents a factor. Hover or click to explore connections.")
    ),
    
    mainPanel(
      visNetworkOutput("network", height = "600px")
    )
  )
)

server <- function(input, output) {
  output$network <- renderVisNetwork({
    nodes <- data.frame(id = 1:7,
                        label = c("MERN: Missed Earnings", 
                                  "CLCO: Cloud Compete", 
                                  "INTR: Interest Rate",
                                  "STDR: Stock Drop", 
                                  "IVPN: Investor Panic", 
                                  "LAYF: Layoffs", 
                                  "STRP: Strategic Pivot"))
    
    edges <- data.frame(from = c(1, 2, 3, 4, 4, 5),
                        to   = c(4, 4, 4, 5, 6, 7))
    
    visNetwork(nodes, edges, height = "500px", width = "100%") %>%
      visNodes(shape = "dot", size = 20,
               font = list(size = 16, color = "#000000", face = "Arial"),
               color = list(background = "#1E90FF", border = "#000000", highlight = "#FF4500")) %>%
      visEdges(arrows = "to",
               color = list(color = "#696969", highlight = "#FF4500")) %>%
      visLayout(randomSeed = 42) %>%
      visOptions(highlightNearest = TRUE, nodesIdSelection = TRUE)
  })
}

# Run the app
shinyApp(ui = ui, server = server)