# 1. str
# Essa função responde: o que existe nesse objeto?

# function
str(mean)

# vector
a = 1:20
summary(a)
str(a)

# list
b = list(a = 1:20, b = 2, c = list(1:5))
summary(b)
str(b)

# factor
f = gl(40,10)
summary(f)
str(f)

# dataset
library(datasets)W
dataset = airquality
summary(dataset)
head(dataset)
head(dataset,3)
str(dataset)

# matrix
m = matrix(1:100,10,10)
summary(m)
str(m)

# split retorna uma lista
s = split(airquality, airquality$Month)
summary(s)
str(s)

# 2. simulate random variables

# antes de gerar uma variavel randomica a seed serve para gerar o mesmo conjunto futuramente
set.seed(1)

# quando mais variaveis forem geradas mais o conjunto se paproximara da mean e sd informadas
r1 = rnorm(5,mean = 8, sd = 1)
r1
mean(r1)
sd(r1)

r2 = rpois(10, lambda = 1) # lambda = mean
r2
mean(r2)
sd(r2)

# 3. simulate random linear models
set.seed(20)
x = rnorm(100)
e = rnorm(100,0,2)
y = 0.5 + 2 * x + e
summary(y)
plot(x,y)

set.seed(10)
x = rbinom(100,1,0.5)
e = rnorm(100,0,2)
y = 0.5 + 2 * x + e
summary(y)
plot(x,y)

set.seed(1)
x = rnorm(100)
log.mu = 0.5 + 0.3 * x
y = rpois(100, exp(log.mu))
summary(y)
plot(x,y)

# 4. simulate random samples

x = sample(1:10, 2)
x
x = sample(1:10, 2)
x
x = sample(1:10)
x
x = sample(1:10, replace = T)
x

# 5. R Profiler

# decorrido > usuario
# o processamento da função em si é rapido, porém existe uma demora para acessar o site e tarzer as informações, o que reflete no tempo decorrido
time = system.time(
        readLines("http://www.jhsph.edu")
)
time

x = readLines("http://www.jhsph.edu")
x[1:10]

# decorrido < usuario
# o processamento é paralelizado, por exemplo, se o codigo é paralelizado em 2 cores em determinada função, o tempo de usuario dela vai ser aproximadamente o dobro do tempo decorrido
hilbert = function(n){
        i = 1:n
        1/ outer(i - 1,i,"+")
}
x = hilbert(1000)
x[1:10]

time = system.time(sdv(x)) # essa função só roda no mac
time

# decorrido = usuario
# processos que não caem nas duas condições anteriores (demoras relacionadas a acontecimentos externos e paralelismo) tendem a ser iguais, ou seja
# o tempo de exibiçlão ao usuario e o tempo de processamento da função é o mesmo

time = system.time({
        n = 1000
        r = numeric(n)
        for(i in 1:n){
                x = rnorm(n)
                r[i] = mean(x)
        }
})
time

# nunca usar system.time() e Rprof() juntas

Rprof()
print("oi")
Rprof(NULL)
