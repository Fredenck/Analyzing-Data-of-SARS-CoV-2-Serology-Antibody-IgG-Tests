# Load packages
library(shiny)
library( shinyWidgets )
library(shinythemes)
library(dplyr)
library(readr)

# Load data
table <- read.csv("P-ED-Fig6.csv")
id <- table$Patient.ID
# group <- table$Group
days <- table$Days.after.symptoms.onset
igg <- table$IgG..S.CO.
igm <- table$IgM..S.CO.
# trend_description <- read_csv("data/trend_description.csv")

# Define UI
ui <- fluidPage(theme = shinytheme("lumen"),
                titlePanel("Covid Antibodies Over Time"),
                sidebarLayout(
                  sidebarPanel(
                    
                    # Select type of trend to plot
                    selectInput(inputId = "type", label = strong("Antibody Type"),
                                choices = c("IgG", "IgM"),),
                  ),
                  
                  # Output: Description, lineplot, and reference
                  mainPanel(
                    plotOutput(outputId = "scatterplot", height = "300px"),
                    # textOutput(outputId = "desc"),
                    tags$a(href = "https://www.google.com", "Source: some database", target = "_blank")
                  )
                )
)

# Define server function
server <- function(input, output) {
  
  
  # Create scatterplot object the plotOutput function is expecting
  output$scatterplot <- renderPlot({
    vid = c(paste0("Patient ", id))
    if (input$type == "IgG"){
      ydat = igg
    }else if (input$type == "IgM"){
      ydat = igm
    }
    ggplot(table, aes(x = factor(days), 
                      y = ydat,
                      color = vid, 
                      group = id)) +
      labs(title = "Patient IgG Levels Over Time",
           x = "Days After Onset", 
           y = "IgG Levels",
           color = "Patient ID") +
      geom_line() +
      geom_point(size = 1)
  })
  
  # # Pull in description of trend
  # output$desc <- renderText({
  #   trend_text <- filter(trend_description, type == input$type) %>% pull(text)
  #   paste(trend_text, "The index is set to 1.0 on January 1, 2004 and is calculated only for US search traffic.")
  # })
}

# Create Shiny object
shinyApp(ui = ui, server = server)