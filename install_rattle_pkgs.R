pkgs <- c(
  'BiocManager',
  'Ckmeans.1d.dp',
  'Hmisc',
  'NeuralNetTools',
  'ROCR',
  'SnowballC',
  'VIM',
  'ada',
  'amap',
  'arules',
  'arulesViz',
  'biclust',
  'corrplot',
  'descr',
  'devtools',
  'fBasics',
  'ggcorrplot',
  'ggtext',
  'ggplotify',
  'ggthemes',
  'hmeasure',
  'janitor',
  'lubridate',
  'magrittr',
  'mice',
  'naniar',
  'neuralnet',
  'nnet',
  'partykit',
  'randomForest',
  'rattle',
  'readr',
  'reshape',
  'rpart',
  'sigmoid',
  'skimr',
  'tidyverse',
  'tm',
  'verification',
  'wordcloud',
  'wskm',
  'xgboost')

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager", repos = "https://cloud.r-project.org")
}

cran_missing <- setdiff(pkgs, rownames(installed.packages()))
if (length(cran_missing) > 0) {
  install.packages(cran_missing, repos = "https://cloud.r-project.org")
}

# Special case for Text Mining

if (!requireNamespace('Rgraphviz')) {
  BiocManager::install("Rgraphviz")
}

# Sepcial case for Text Mining using word2vec

if (!requireNamespace('wordVectors')) {
  devtools::install_github("bmschmidt/wordVectors")
}
