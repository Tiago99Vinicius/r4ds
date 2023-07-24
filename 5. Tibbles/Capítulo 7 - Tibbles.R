#Inicialização do tidyverse
library(tidyverse)

#Tibbles----
iris #tabela no formato data.frame
str(iris) #reporta o tipo do dataset e de cada uma de suas colunas(ex.: num, factor...)

##Básico Tibbles----
###Data.Frame para Tibble----
as_tibble(iris) 

###Vetores para Tibble----
ds <- tibble(
  x = 1:25,
  y = 1,
  z = x^2 + y,
  `:)` = 5
)

###Tribble----
tribble(
  ~x, ~y, ~z,
  #--,--,---,
  "a", 1, 3.6,
  "b", 2, 8.5
)

###Print Tibbles----
print(ds, n = 12, width = Inf) #printando tibbles no console com linhas definidas e todas as colunas

##Subconjuntos----
###Forma 1----
ds$x
ds$`:)`

###Forma 2----
ds[["x"]]
ds[[1]]

###Forma em pipe----
ds %>% .$x
ds %>% .[["x"]]
