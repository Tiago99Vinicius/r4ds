# Importação do pacote tidyverse.
library(tidyverse)

# Salvamento de gráfico em pdf
ggplot(diamonds, aes(carat,price)) +
  geom_hex()
ggsave("diamonds.pdf")

# Criação de arquivo csv
write_csv(diamonds, "diamonds.csv")

# Use getwd() para ver o diretório de trabalho atual
