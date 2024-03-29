# Map 1-based optional input ports to variables
cleandata <- maml.mapInputPort(1) # class: data.frame

# Contents of optional Zip port are in ./src/
# source("src/yourfile.R");
# load("src/yourData.rdata");
install.packages("src/parallelMap_1.3.zip", lib = ".", repos = NULL, verbose = TRUE)
install.packages("src/backports_1.1.0.zip", lib = ".", repos = NULL, verbose = TRUE)
install.packages("src/checkmate_1.8.3.zip", lib = ".", repos = NULL, verbose = TRUE)
install.packages("src/BBmisc_1.11.zip", lib = ".", repos = NULL, verbose = TRUE)
install.packages("src/ParamHelpers_1.10.zip", lib = ".", repos = NULL, verbose = TRUE)
install.packages("src/mlr_2.11.zip", lib = ".", repos = NULL, verbose = TRUE)

library(backports, lib.loc=".", verbose=TRUE)
library(ParamHelpers, lib.loc=".", verbose=TRUE)
library(mlr, lib.loc=".", verbose=TRUE)
dummydata <- createDummyFeatures(cleandata, cols = c("flag_fthb", "cd_msa", "ppmt_pnlty"), method = "reference")
table(dummydata$prop_type)
dummydata <- createDummyFeatures(dummydata, cols = c("occpy_sts", "channel", "prop_type", "loan_purpose"), method = "reference")

# Select data.frame to be sent to the output Dataset port
maml.mapOutputPort("dummydata");