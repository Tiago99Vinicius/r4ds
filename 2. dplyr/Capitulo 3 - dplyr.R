#Inicialização do tidyverse e nycflights13----
#install.packages("nycflights13")
library(nycflights13)
library(tidyverse)

#nycflights13----
print(flights)
view(flights) #talvez precise escrever "View()"(Capitalized)

#Básico do dplyr----
##filter----
(jan1 <- filter(flights, month == 1, day == 1)) 
#Atribuição entre parênteses atribui e printa simultaneamente
#Os operadores de comparação são: >,>=,<,<=,!=,==

###in----
filter(flights, month %in% c(11, 12))

###is.na----
filter(flights, dep_time == 2400 | is.na(dep_time))
#Os operadores lógicos são: &(and), |(or) e !(not)


##arrange----
arrange(flights, desc(dep_delay), arr_delay)
#Ordena os voos pelo campo "dep_delay" em ordem decrescente e usa 
#o campo "arr_delay" como critério de desempate em ordem crescente


##select----
select(flights, year, month, day)
#Seleciona as colunas explicitadas("year", "month" e "day")

select(flights, year:day)
#Seleciona todas as colunas entre "year" e "day"(com eles inclusos)

select(flights, -(year:day))
#Seleciona todas as colunas exceto as que estão entre "year" e "day"(com eles inclusos)

###everything----
select(flights, time_hour, air_time, everything())
#move os campos explicitados para as primeiras colunas e mantém o resto na sequência

###rename----
rename(flights, tail_num = tailnum)
#renomeia variável/campo, pode ser feito com select também,
#porém os outros campos serão ignorados neste caso.


##mutate----
flights_sml <- select(flights, 
                      year:day,
                      ends_with("delay"),
                      distance,
                      air_time) #select usado para facilitar a visualização
mutate(flights_sml,
       gain = arr_delay - dep_delay,
       hours = air_time/60,
       gain_per_hour = gain/hours)

###transmute----
transmute(flights,
          dep_time,
          hour = dep_time %/% 100,
          minute = dep_time %% 100)

##summarize----
summarize(flights, delay = mean(dep_delay, na.rm = TRUE))

###group_by----
by_da <- group_by(flights, year, month, day)
summarize(by_da, delay = mean(dep_delay, na.rm = TRUE))
 
###pipe----
flights %>%
  group_by(dest) %>%
  summarize(
    count = n(),
    dist = mean(distance, na.rm = TRUE), #na.rm desconsidera todos os valores NA
    delay = mean(arr_delay, na.rm = TRUE)) %>%
  filter(count > 20, dest != "HNL") %>%
  ggplot(mapping = aes(x = dist, y = delay)) +
    geom_point(aes(size = count), alpha = 1/3) +
    geom_smooth(se = FALSE)





