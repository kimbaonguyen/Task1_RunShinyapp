# Load Shiny library
library(shiny)
############# Load table ############# 
path = "Desktop/Moffitt/bladder_cleaned_meta_v2_2846.tsv"
bladder_cleaned_meta_v2_2846 <- read_delim(path, 
                                           delim = "\t", escape_double = FALSE, 
                                           trim_ws = TRUE)
View(bladder_cleaned_meta_v2_2846)

############# Calculate the TURBT and Metastasis ###########
# TURBT
sum(bladder_cleaned_meta_v2_2846[["turbt_cystectomy_JD"]] == "TURBT", na.rm = TRUE) 
#Metastasis
sum(bladder_cleaned_meta_v2_2846[["clinical_outcome_JD"]] == "metastasis", na.rm = TRUE)
############# Sample data (replace with your own dataframe) ###########
df <- bladder_cleaned_meta_v2_2846


############# Generate Shiny App ###############

# Define UI
ui <- fluidPage(
  titlePanel("Display DataFrame in Shiny App"),
  
  # Output the table
  tableOutput("dataTable")
)

# Define Server logic
server <- function(input, output) {
  # Render the dataframe as a table
  output$dataTable <- renderTable({
    df  # Replace 'df' with your actual dataframe
  })
}

# Run the app
shinyApp(ui = ui, server = server)


