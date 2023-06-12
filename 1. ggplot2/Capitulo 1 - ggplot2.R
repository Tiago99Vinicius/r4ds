#Inicialização do tidyverse----
#install.packages("tidyverse") #comando para instalar pacotes("tidyverse")
library(tidyverse)
tidyverse_update() #atualiza o tidyverse
 #comando para chamar pacotes(tidyverse)

#DataFrame mpg----
print(mpg) #mpg(milhas por galão) é um dataframe do ggplot2
#usar "?mpg" pra ver o descritivo desta base

#Criando ggplots----
##Camada de Pontos(Dispersão)----
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) #displ(tamanho do motor) e hwy(eficiência do combustível)

###Mapeamento Estético----
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

####Color----
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) #class(tipo de carro)

####Size----
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

####Shape----
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

####Alpha(Transparência)----
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
#usar "?geom_point" para saber mais sobre essa função e suas estéticas.

###Ajuste de Posição----
####jitter----
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(position = "jitter")

###Facetas----
####facet_wrap----
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2, ncol = 4)

####facet_grid----
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl) #drv(tipo do trem de força) e cyl(número de cilíndros)

##Objetos Geométricos - Linha----
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

###Mapeamento Estético----
####LineType----
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv),
  se = FALSE, #Tira a sombra de variância da curva traçada
  show.legend = FALSE) #Tira a legenda do gráfico

####Group----
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

##Geoms Múltiplos----
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

###Mapeamentos Globais----
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()

##Transformações Estatísticas----
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut),
           stat = "count")
#O "geom_bar" usa como valor padrão o "stat_count"

###stat_count----
ggplot(data = diamonds) +
  stat_count(mapping = aes(x = cut))

###stat_identity----
demo <- tribble(
  ~a, ~b,
  "bar_1", 20,
  "bar_2", 30,
  "bar_3", 40
)

ggplot(data = demo) +
  geom_col(mapping = aes(x = a, y = b))
#O "geom_col" usa como valor padrão o "stat_identity"

ggplot(data = demo) + 
  geom_bar(mapping = aes(x = a, y = b), 
           stat = "identity")

###stat_summary----
ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median)

##Objetos Geométricos - Barra----
###Mapeamento Estético----
####Color----
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut))

####Fill----
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))

###Ajuste de Posição----
####stack(padrão)----
ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
  geom_bar(position = "stack")

####identity----
ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
  geom_bar(alpha = 1/5, position = "identity")

ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
  geom_bar(fill = NA, position = "identity")
#O Ajuste de posição "identity" não é muito útil para barras

####fill----
ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
  geom_bar(position = "fill")

####dodge----
ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
  geom_bar(position = "dodge")


ggplot(data = mpg, aes(x = class, y = hwy)) +
  geom_boxplot(position = "dodge2")

##Sistemas de Coordenadas----
###coord_flip----
ggplot(data = mpg, aes(x = class, y = hwy)) + 
geom_boxplot()

ggplot(data = mpg, aes(x = class, y = hwy)) + 
geom_boxplot() +
coord_flip()

###coord_quickmap----
nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) + 
  geom_polygon(fill = "white", color = "black")

ggplot(nz, aes(long, lat, group = group)) + 
  geom_polygon(fill = "white", color = "black") + 
  coord_quickmap()

###coord_polar----
bar <- ggplot(data = diamonds, aes(x = cut, fill = cut)) + 
  geom_bar(width = 1) +
  theme(aspect.ratio = 1) + 
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()


