library(shiny)
#
library(plyr)
#
which_catalog <- function(in_catalog,in_category) {
  if (in_catalog == 'April 23') {
    catalog_input <- read.csv("catalog_0423.csv",fill=TRUE, stringsAsFactors=FALSE, header=TRUE)
  } 
  else {
    catalog_input <- read.csv("catalog_0430.csv",fill=TRUE, stringsAsFactors=FALSE, header=TRUE)
  }
  if (in_category == 'Apparel') {
    get_quant(catalog_input,c("gl_apparel"))
  } 
  else {
    get_quant(catalog_input,c("gl_home"))
  } 
}
#
get_quant <- function(x_df,y_gl) {
  quant_sub <- subset(x_df, ProductGroup == y_gl)
  quant_list <- tapply(quant_sub$Price, quant_sub$Type, quantile)
  quant_df <- do.call(rbind.data.frame, quant_list)
  colnames(quant_df) <- c("Lowest_Price", "25%","50%","75%","Max_Price")
  quant_df
}
#
shinyServer(
  function(input,output) {
    output$Catalog <- renderPrint({input$Catalog})
    output$Category <- renderPrint({input$Category})
    output$quant_results <- renderPrint({which_catalog(input$Catalog,input$Category)})
  }
)