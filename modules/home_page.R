# Home Page Module
# This module provides the introduction and overview of the Shiny app.

# UI for the Home Page Module
home_page_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidPage(
      titlePanel("Face of a Superstar: Baseball Hall of Fame Predictor"),
      sidebarLayout(
        sidebarPanel(
          h3("Welcome to the Superstar Predictor App!"),
          p("This app uses cutting-edge image processing and machine learning techniques to predict whether a baseball player has the potential to be a Hall of Famer."),
          p("Here's what you can do with this app:"),
          tags$ul(
            tags$li("Upload images of baseball players for analysis"),
            tags$li("View predictions and insights about Hall of Fame potential"),
            tags$li("Explore how physical attributes correlate with success in baseball")
          )
          
        ),
        mainPanel(
          h4("Getting Started"),
          p("Navigate through the app using the tabs above to upload images, view predictions, and learn about the methodology behind our predictions.")
        )
      )
    )
  )
}

# Server for the Home Page Module
home_page_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Add server-side logic if needed in the future
  })
}
