library(shiny)
shinyUI(pageWithSidebar(
# Application Title
  headerPanel("XYZ.com Product Category Price Quantiles"),
  
  sidebarPanel(
    selectInput('Catalog', 'Please select a catalog date you would like to analyze:', 
                choices = c('April 23'='April 23','April 30'='April 30')),
    selectInput('Category', 'Please select a category of product you would like to analyze:', 
                choices = c('Apparel'='Apparel','Home'='Home'))
#    submitButton('Submit')
  ),
  mainPanel(
    h4('You Selected Catalog Date:'),
    verbatimTextOutput("Catalog"),
    h4('You Selected Product Category:'),
    verbatimTextOutput("Category"),
    h4('Quantile Results in USD:'),
    verbatimTextOutput("quant_results"),
    h6('Lowest Price - The lowest price for this product category/type'),
    h6('25% - For products in the category/type, 25% of the prices are below this amount'),
    h6('50% - For products in the category/type, 50% of the prices are below this amount'),
    h6('75% - For products in the category/type, 75% of the prices are below this amount'),
    h6('Max Price - The highest price for this product category/type')
    )
))