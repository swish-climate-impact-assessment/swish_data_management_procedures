#### name:envepi_data_pipeline ####
setwd("~/projects/hanigan-thesis")
# workflow
library(disentangle)
library(stringr)
filesList <- read.csv("thesis/envepi_data_pipeline.csv", stringsAsFactors = F, strip.white = T)
str(filesList)
nodes_graphy <- newnode(
  indat = filesList
  ,
  names_col = "STEP"
  ,
  in_col = "INPUTS"
  ,
  out_col = "OUTPUTS"
  ,
  desc_col = "DESCRIPTION"
  ,
  clusters_col = "CLUSTER"
  ,
  todo_col = NULL #"STATUS"
  ,
  nchar_to_snip = 75
)
getwd()
setwd("thesis")
sink("envepi_data_pipeline_test.dot")
cat(nodes_graphy)
sink()
# NB this was not exactly what I wanted so dev things in the test dot
#file, then deploy to this

system("dot -Tpdf envepi_data_pipeline_test.dot -o envepi_data_pipeline_test.pdf")
browseURL("envepi_data_pipeline_test.pdf")

# hand tweaked
#system("dot -Tpdf envepi_data_pipeline.dot -o envepi_data_pipeline.pdf")
#system("dot -Tpng envepi_data_pipeline.dot -o envepi_data_pipeline.png")
setwd("..")
