# Load necessary libraries
library(shiny)

# Source modules
source("modules/home_page.R")

# Define UI
ui <- fluidPage(
  navbarPage(
    "Superstar Predictor",
    tabPanel("Home", home_page_ui("home"))
  )
)

# Define Server
server <- function(input, output, session) {
  home_page_server("home")
}

# Run App
shinyApp(ui, server)
