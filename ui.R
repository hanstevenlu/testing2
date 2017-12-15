library(shiny)
library(leaflet)

# Choices for drop-downs
vars <- c(
  'Collision Vehicle 1' = 'VEHICLE.TYPE.CODE.1',
  'Collision Vehicle 2' = 'VEHICLE.TYPE.CODE.2',
  "Injuries" = "NUMBER.OF.PERSONS.INJURED",
  "Deaths" = "NUMBER.OF.PERSONS.KILLED"
)

vars2 <- c(
  "Injuries" = "NUMBER.OF.PERSONS.INJURED",
  "Deaths" = "NUMBER.OF.PERSONS.KILLED"
)

vars3 <- c(
  "All Vehicles" = "",
  "Ambulance" = "AMBULANCE",
  "Bicycle" = "BICYCLE",
  "Bus" = "BUS",
  "Fire Truck" = "FIRE TRUCK",
  "Large Commercial Vehicle(6 or more tires)" = "LARGE COM VEH(6 OR MORE TIRES)",
  "Motorcycle" = "MOTORCYCLE",
  "Passenger" = "PASSENGER VEHICLE",
  "Pick-up Truck" = "PICK-UP TRUCK",
  "Small Commercial Vehicle(4 tires)" = "SMALL COM VEH(4 TIRES)",
  "Taxi" = "TAXI",
  "Van" = "VAN"
)

vars4 <- c("All boroughs"="",
           'Manhattan'='MANHATTAN',
           'Brooklyn'='BROOKLYN',
           'Queens'='QUEENS',
           'Bronx'='BRONX',
           'Staten Island'='STATEN ISLAND')

shinyUI(navbarPage("NYPD Vehicle Accidents Map", id="nav",
                   
                   tabPanel("NYC map",
                            div(class="outer",
                                
                                tags$head(
                                  # Include our custom CSS
                                  includeCSS("styles.css"),
                                  includeScript("gomap.js")
                                ),
                                
                                leafletOutput("map", width="100%", height="100%"),
                                
                                absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                                              draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
                                              width = 250, height = "auto",
                                              
                                              h2("Vehicle Collisions"),
                                              
                                              selectInput("color", "Color", vars),
                                              selectInput("size", "Size", vars2, selected = "NUMBER.OF.PERSONS.INJURED"),
                                              checkboxInput("cluster", "Add Cluster"),
                                              helpText("Cluster numbers show total accidents for each area", 
                                                       "(applies to all vehicles only)"),
                                              radioButtons("vehicle", "Show Just One Vehicle", vars3, selected = '')
                                ),
                                
                                tags$div(id="cite",
                                         'Data from: ', tags$em('NYPD Motor Vehicle Collisions'), '  | NYC Open Data. 
                                         Details of Motor Vehicle Collisions in New York City provided by the 
                                         Police Department (NYPD).'
                                )
                                )
                                ),
                   conditionalPanel("false", icon("crosshair"))
                            ))

