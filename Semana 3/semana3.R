# 1. lapply
# Aplica uma função em cada elemento de uma lista x
# cada elemento da lista x vai ser usado de parametro para essa função.
# retorna umna lista sempre

x = list(a = 1:5, b = rnorm(10), 10)
y = lapply(x, mean)

y = lapply(1:4, runif) # runif é uma função quer cria um conjunto de números uniformes

# parâmetros extras serão entregues à função
y = lapply(1:4, runif, min=4, max=10)

# uma função anônima (sem nome) que retorna a primeir acoluna das matrizes
x = list(a = matrix(1:4,2,2), b = matrix(1:6,3,2))
y = lapply(x, function(x) x[,1])


# 2. sapply
# igual ao lapply, porém simplifica o resultado retornando um vetor/matriz, o que em alguns casos é melhor do que uma lista

x = list(a = 1:5, b = rnorm(10), 10) # runif é uma função quer cria um conjunto de números normalizados
y = sapply(x, mean)

# 3. apply
# aplica a função para para linha/coluna de uma matriz
# retorna um vetor/matriz

# existe funções como colSums, colMeans, rowSums  e rowMeans que são ainda mais otimizadas e rápidas
x = matrix(rnorm(200),20,10)
y = apply(x,2,mean) # calcula a média de cada uma das colunas
y = apply(x,1,mean) # calcula a média de cada uma das linhas

y = apply(x,1,quantile, probs = c(0.25,0.75) )

# criando um array de dimensões 2x3x10. 2 linhas, 3 colunas, 10 terceiras. é como se fossem 10 matrizes 2x3
x = array(rnorm(40),c(2,3,10))
y = apply(x,c(1,2),mean) # média de cada uma das cordedadas das 10 matrizes

y =  rowMeans(x, dims=2) # média de cada uma das cordedadas das 10 matrizes

# 4. mapply
# executa uma mesma função com diferentes paraêmetros de entrada
# retorna um vetor com os resultados

x = list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))

arg1 = 1:4
arg2 = 4:1
y = mapply(rep,arg1,arg2)

noise  = function(n, mean, sd){
        rnorm(n,mean,sd)
}
y = mapply(noise, 1:5, 1:5, 2)

# 5. tapply
# cria subsets de um vetor baseado em outro vetor e aplica funções sobre cada subset
# retorna um vetor

x = c(rnorm(10), runif(10), rnorm(10,1)) # cria um vetor de 30 números
f = gl(3,10) # cria um factor de 3 niveis e repete cada um deles 10 vezes
y = tapply(x,f,mean)
y = tapply(x,f,range)

# 6. split
# cria subsets de um vetor baseado em outro vetor
# é igual o que é feito no tapply, porém não aplica nenhuma função nos subsets e retorna eles
# retorna uma list (justamente a entrada do lapply, por isso são usadas em conjunto frequentemente)

x = c(rnorm(10), runif(10), rnorm(10,1)) # cria um vetor de 30 números
f = gl(3,10) # cria um factor de 3 niveis e repete cada um deles 10 vezes
y = split(x,f)

y = lapply(split(x,f),mean) # mesma coisa quetapply(x,f,mean), porem o tapply retorna um vetor e o lapply um list

library(datasets)
head(airquality)
s = split(airquality,airquality$Month)
y = lapply(s, function(x) colMeans(x[, c("Ozone","Solar.R","Wind")], na.rm = T)) # retorna como uma lista
y = sapply(s, function(x) colMeans(x[, c("Ozone","Solar.R","Wind")], na.rm = T)) # retorna como uma matriz, simplificando


f1 = gl(2,5) # cria um factor de 2 niveis e repete cada um deles 5 vezes
f2 = gl(5,2) # cria um factor de 5 niveis e repete cada um deles 2 vezes
f = interaction(f1,f2) # combina 2 factores criando um novo com novos niveis combinados

s = split(airquality, list(airquality$Month,airquality$Temp))
s = split(airquality, list(airquality$Month,airquality$Temp), drop = T) # drop elimina os grupos os factors vazios no resultado

# 6. Debug

returnValue = function(x) x
returnValue("oi")

returnValue2 = function(x) invisible(x)
returnValue2("oi") # impete o auto print do retorn no console

# 6.1 Traceback

mean(j) # j não existe
traceback() # mostra onde aconteceu o erro (tem que ser executada imediatamente depois da mensagem de erro)

# 6.2 Debug

debug(mean) # toda vez que a função for executada ela entra em modo debug
mean(1:5)
# abre o browser, um console do ambiente da função
# no browser(console) n + enter ou f10 para andar pro proximo step
undebug(mean) # remove debug da função

# 6.3 Recover

options(error = recover)
mean(j)
# abre um menu quando o erro acontecer mostrando os ambientes de todas as funções executadas até o erro e permite que vocÊ abra o browser em cada ambiente
    