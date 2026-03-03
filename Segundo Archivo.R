install.packages('dplyr')
library(dplyr)


View(iris)


head(iris, 3)

iris %>% head(3)

iris %>% tail(4)

iris %>% slice(3:5)


# Analogías con SQL -------------------------------------------------------


# 1. SELECT ---------------------------------------------------------------

# %>% --> PIPE (conector)
# |> -> PIPE

# SELECT TOP 3 
# Species
# FROM iris

# En R el orden da igual

iris %>% select(Species) %>% head(3)
iris %>% head(3) %>% select(Species)
iris %>% select(Species, Petal.Width) %>% head(4)
iris %>% select(starts_with('Sepal')) %>% head(4)


# 2. DISTINCT -------------------------------------------------------------

#SELECT DISTINCT
#Species
#FROM iris

iris %>%  distinct(Species)


# 3. ORDER BY -------------------------------------------------------------

iris %>% arrange(Petal.Width) %>% 
View()
iris %>% arrange(desc(Petal.Width)) %>% 
View()


# 4. WHERE ----------------------------------------------------------------

# Quiero las filas de especie 'Virginica'

filtro <- iris$Species == 'virginica'
iris[filtro,] # Es lo mismo que hacer esto pero mas cómodo

iris %>% filter(Species == 'virginica') %>% 
  head(3)

iris %>% filter(Species == 'virginica' & Sepal.Length > 7) %>% 
  head(3)


#SELECT DISTINCT
# Species
# FROM iris
# WHERE Species Like '%a%'

iris %>% 
  distinct(Species) %>%
  filter(grepl('a', Species)) #Contiene a

iris %>% 
  distinct(Species) %>% 
  filter(grepl('a$', Species)) #Termine con a


# 5. AGREGAR COLUMNAS -----------------------------------------------------

iris %>% 
  mutate(
    largo_sobre_ancho = Petal.Length / Petal.Width,
    mayor_petal = case_when(
      Petal.Length > 5 ~ 'Es mayor a 5',
      Petal.Length > 1.4 ~ 'Es mayor a 1.4',
      .default = 'Menor'
         )
  ) %>% head(20)


# 6. CAMBIAR DATO COLUMNA -------------------------------------------------

iris %>% 
  mutate(
    largo_sobre_ancho = Petal.Length / Petal.Width,
    mayor_petal = case_when(
      Petal.Length > 5 ~ 'Es mayor a 5',
      Petal.Length > 1.4 ~ 'Es mayor a 1.4',
      .default = 'Menor'
    ),
    Sepal.Length = as.integer(Sepal.Length)
  ) %>% head(5)


# 7. GROUP BY -------------------------------------------------------------

#SELECT
 #Species,
 #AVG (Sepal.lenght) As promedio
 #FROM iris
 #GROUP BY Species

iris %>% 
  group_by(Species) %>% 
  summarise(
    promedio_sl = mean(Sepal.Length),
    suma_sl = sum(Sepal.Length),
    minimo_sl = min(Sepal.Length),
    maximo_sl = max(Sepal.Length),
    cantidad_sl = n(), # cuenta filas
    cantidad_distintos_sl = n_distinct(Sepal.Length)
  )


# 8. WINDOWS FUNCTION ------------------------------------------------------

#setosa            5.01    250.       4.3       5.8          50                    15
#2 versicolor        5.94    297.       4.9       7            50                    21
#3 virginica         6.59    329.       4.9       7.9          50                    21


#SELECT *
#  ,,
#AVG (sepal.lenhgt) OVER (pertition BY Species) AS promediosl
#FROM iris


iris %>% 
  group_by(Species) %>% 
 mutate(
    promedio_sl = mean(Sepal.Length),
    suma_sl = sum(Sepal.Length),
    minimo_sl = min(Sepal.Length),
    maximo_sl = max(Sepal.Length),
    cantidad_sl = n(), # cuenta filas
    cantidad_distintos_sl = n_distinct(Sepal.Length)
  ) %>% 
  View()


# 9. JOIN -----------------------------------------------------------------

band_members
band_instruments

band_members %>% left_join(band_instruments)   # Detecta la columna en comun por defecto
band_members %>% left_join(band_instruments, by = 'name')
band_members %>% right_join(band_instruments, by c( 'name' = 'name')) #Aclarar
band_members %>% inner_join(band_instruments) %>% View()
band_members %>% full_join(band_instruments)




