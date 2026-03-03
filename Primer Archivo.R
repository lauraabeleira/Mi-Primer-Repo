
# 1. IF Condicionales -------------------------------------------------------

# Ejemplo 1

edad<- 20

if (edad >= 18) {
  print('Es mayor de edad')
} else {
  print('Es menor de edad')
};

# Ejemplo 2

temperatura <- 20

if (temperatura>=30) {
  print('Hace calor')
} else if (temperatura >=15) {
  print('Lindo clima no para Nacho')
} else if (temperatura >=8) {
  print('Lindo clima')
} else {
  print('Hace frío')
};

# Ejemplo 3 

notas <- c(75, 90, 60, 85, 78)

# Si todas las notas de las asignaturas tienen que ser mayores a 70, no aprueban

if (all(notas > 70)) {
  print ('Apruebo')
} else {
  print('Suspendo')
};

# Si solo alguna tiene que ser mayor a 70, entonces apruebo

if (any(notas > 70)) {
  print ('Apruebo')
} else {
  print('Suspendo')
};

# Ejemplo 4

mes <- 'Diciembre'
dia <- '23'

if (mes == 'Diciembre') {
  if (dia == 25) {
    print('Feliz Navidad!')
  } else {
    print('Es diciembre, pero no es navidad')
  }
} else {
  print('No es diciembre')
};


if (mes == 'Diciembre' & dia == 25) {
  print('Feliz Navidad')
} else if (mes == 'Diciembre' & dia != 25) {
  print('Es diciembre, no navidad')
} else {
  print('No es diciembre')
}



# 2. Bucles ---------------------------------------------------------------

# 2.1 FOR -----------------------------------------------------------------

# Primero asigna el valor uno por uno y luego va imprimiendo lo que le pides 
# hasta que llega al final del bucle y para

for (i in c(1,2,3,4,5)) {
  print(i)
}

for (i in c("correo1", "correo2", "correo3")) {
  print(i)
  print("Correo enviado")
}
# iteración 1 -> i = "correo1"
print("correo1")
print("Correo enviado")

# iteracion 2 -> i = "correo2"
print("correo2")
print("Correo enviado")

# Concatenando

for (i in c("correo1", "correo2", "correo3")) {
  print(i)
  print(paste("Correo enviado a:", i))
}

for (num in c(10,20,30,40)) {
  print(paste('El número es:', num))
}


# Ejemplo 1

edades <- c(20,30,15,16,90)

if (edades >= 25) {
  print('Mas de 25 años')
} else {
  print('Tiene menos')
}

# Para que se lo pregunte uno por uno necesitamos bucle

for (i in edades) {if (i >= 25) {
  print(paste('Mas de 25 años. Tiene:', i))
} else {
  print(paste('Tiene menos.Tiene:',i))
}}

# Ejemplo 2

#'rojo', 'verde'

#'pantalon', 'zapatilla'

for (ropa in c('pantalon', 'zapatilla')) {
  for (color in c('rojo', 'verde')) {
    print(paste(ropa,color))
  }
}

#Ejemplo 3

for (i in c(1:100)) {
  print(i)
  if (i >= 5){
    break
  }
}


for (i in c(1:100)) {
  print(i)
  if (i >= 5){
    break
    print('Esto NO')
  }
}

for (i in c(1:100)) {
  print(i)
  if (i >= 5){
    print('Esto NO')
    break
  }
}

for (i in c(1:8)) {
  if (i == 5){
    next
  } 
  print(i)
}

# 2.2 WHILE ---------------------------------------------------------------


for (i in c(1,2,3,4,5)) {
  print(i)
}

i <- 1

# Ejemplo 1:

while (i <= 5) {
  print(i)
  i <- i + 1
}

# Explicación funcionamiento --->

i <- 1
# iteracion 1 -> i<=5? --> si
print(1)
i <- i + 1 #1+1=2 --> i = 2

#iteracion 2 --> i<=5? --> si
print(2)
i <- i + 1 # 2+1 = 3 --> i = 3

# Y sucesivos...

#iteracion 5 --> i<=5? --> si, porque i = 5
print(5)
i <- i + 1 # 5+1 = 6 --> i = 6

# iteracion 6 --> i <=5 ? --> NO --> frena iteraciones


# Ejemplo 2


#0 > 100? --> NO --> 0+30
#30 > 100? --> NO --> 30+40
#70 > 100? --> NO --> 70+10
#80 > 100? --> NO --> 80+70
#150 > 100? --> SI --> Dejo de sumar



#La lógica 

#saldo actual alcanza?
#saldo actual <- saldo actual [i] + 30 = 30
#alcanza?
#saldo actual <- saldo actual [i]+ 40 = 70
#alcanza?
#saldo actual <- saldo actual [i] + 10 = 80
#alcanza?
#saldo actual <- saldo actual[i] + 70 = 150

saldos <- c(30, 40, 10, 70, 80, 20)

saldo_actual <- 0
i <- 1

while (saldo_actual < 100) {
  saldo_actual <- saldo_actual + saldos[i]  #Entiende posición por corchetes
  i <- i + 1
}

#while(se cumpla esto) 
#{quiero que se ejecute este código}
#<- Entonces decido definir porque si nada cambia en la condición, siempre se va a cumplir


# 3. Funciones ------------------------------------------------------------

suma <- function(a , b) {
  resultado <- a + b
  return(resultado)
}

suma(4,5)
suma(67,45)

temperatura <-20

# 1.Tab para adelante todo el codigo
# 2.Definir nombre y argumentos de funcion
# 3.Remplazar print por return ( si no hay agregar)

pronostico <- function(temperatura){
  if (temperatura>=30) {
    return('Hace calor')
  } else if (temperatura >=15) {
    return('Lindo clima no para Nacho')
  } else if (temperatura >=8) {
    return('Lindo clima')
  } else {
    return('Hace frío')
  }
  }

pronostico(8)








