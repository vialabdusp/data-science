library(shiny)
library(mapproj)
library(maptools)

# Load tigris library for downloading Census geometries
library(tigris)
library(leaflet)

setwd("~/Desktop/working/duspviz/r-shiny")
# 
pal <- colorQuantile("YlGn", NULL, n = 5)

ma <- tracts(25, cb = TRUE, year = 2015)

data <- read.csv("data/ma_housing_2015.csv", as.is = TRUE)
data$geoid <- as.character(data$geoid)
data$rou_pct <- (data$mhc_rou * 12) / data$mhi_rou * 100

ma_join <- merge(ma, data, by.x = "GEOID", by.y = "geoid")


ui <- fluidPage(
  titlePanel("Housing Costs by Tenure in Massachusetts"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create a map with information from the 2015 American Community Survey.")
    ),
    
    mainPanel(leafletOutput("map"))
  )
)

# Server logic ----
server <- function(input, output) {
  
  output$map <- renderLeaflet({
    leaflet(ma_join) %>%
      addProviderTiles("CartoDB.Positron") %>%
      addPolygons(fillColor = ~pal(rou_pct), 
                  fillOpacity = 0.8, 
                  color = "#FFFFFF", 
                  weight = 1)
  })
}

# Run app ----
shinyApp(ui, server)