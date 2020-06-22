# 1. Console

x = "Hello"
print (x)
x = 1
print (x)
x =  1:20
print (x) # print explicito
x =  1:-20
x # auto print

# 2. Data types

typeof("carro") # character
typeof(1) # double
typeof(1L) # integer
typeof(as.integer(1))# double
typeof(TRUE) # logical
typeof(1 + 4i) # complex

is.integer(1) # FALSE
is.integer(as.integer(1)) # TRUE

# Double e integer são numeric
is.numeric(1) # TRUE
is.numeric(1L) # TRUE

# 3. Vector
# Vetores sempre tem conteúdos do mesmo tipo
# Seus elementos tem cochetes simples

c(0.5,0.6)
c(TRUE,T,F)
1:5

c("a",T) # TRUE vira um character
c(T,"a") # TRUE vira um character
c(T,5,F) # TRUE vira 1 e FALSE vira 0

# Igual o typeoasf()
class(T) # logical
class(as.character(T)) # character

# 4. Lists
# Listas sempre podem ter conteúdos de diferentes tipos
# Seus elementos tem cochetes duplos

list(T,F,1,"TRUE",1 + 4i)

# 5. Matrix
# Só pode conter uma classe de objetos, como os vetores

m1 = matrix(nrow = 2, ncol = 3)
m1

attributes(m1) # mostra os atributos de uma variável
dim(m1)

m2 = matrix(1:6, nrow = 2, ncol = 3)
m2

m3 = 1:10
dim(m3) = c(2,5)
m3

l1 = c(1:3)
l2 = c(11:13)
l3 = c(21:23)
cbind(l1,l2,l3)
rbind(l1,l2,l3)

# 5. Factors
# São vetores numéricos com labels

options = factor(c("yes","no","yes","yes","no","no"))
attributes(options)
levels(options)

unclass(options)
table(options)

options = factor(c("yes", "no"), levels = c("yes","no"))
unclass(options)

# 6. Missing values
# Um valor NaN é NA, mas um NA não é NaN

is.na(NA) # TRUE
is.nan(NA) # FALSE
is.na(NaN) # TRUE
is.nan(NaN) # TRUE

# 7. Data frames
# Cada coluna pode te rum tipo de classe

df = data.frame(foo = 1:4, bar=c(T,T,F,F))

nrow(df)
ncol(df)
attributes(df)
rownames(df) = c("obs1","obs2","obs3","obs4")
df
colnames(df) = c("foo1","bar1")
df
colnames(df)[2] = "bar2"
df

# 8. Names

# Vetores
n = 1:3
n
names(n) = c("a","b","c")
n

# Listas
l = list(a = 1, b = 2, c = 3)

# Matrizes
m = matrix(1:4, nrow=2, ncol=2)
m
dimnames(m) = list(c("linha1","linha2"),c("coluna1","coluna2"))
m
colnames(m)[2] = "coluna3"
m

# 9. Reading files

# read.table, read.csv
# readLines
# source
# dget
# load
# unserialize

# 10. Writing files

# write.table
# writeLines
# dump
# dput
# save
# serialize

# 11. Connections

# file
# gzfile
# bzfile
# url

# 12. Subsetting

# Vetor
# usa [], que sempre retorna uma lista
x = c("a","b","c","d","b","e")
x[1]
x[1:2]
x[x > "b"] # retorna letras maiores que b
u = x > "b" # retorna uma lista de booleans
u
x[u] # retorna todos os index onde u for T

# List
# usa [], que sempre retorna uma lista
# usa [[]], para acessar um vetor dentro da lista, retorna o tipo do elemento
# usa $ para acessar pelo nome do index, retorna o elemento
x = list(a = 1:4, b = 0.6, c = "car")
x[1]
x[[1]]
x$b
x["b"]
x[["b"]]

x[c("a","b")] # só funciona com [], com [[]] e $ não
x[c(1,2)] # só funciona com [], com [[]] e $ não

name = "a"
x[name]
x[[name]] # para $ não funciona

y = list(list(10,20,30), b = c(40,50,60))
y
y[c(1,2)] # acessa o index 1 e 2
y[[c(1,2)]] # acessa o index 1 e dentro dele o index 2
y[[c(2,3)]] # acessa o index 2 e dentro dele o index 3

# Matriz
# usa [], que nesse caso retorna uma matriz
m = matrix(1:6, 2, 3)
m[2,2] # pega linha, coluna
m[1,] # pega a linha 1
m[,3] # pega a coluna 3

class(m[,3]) # retorna o tipo do elemento, como os [[]]
class(m[,3,drop = F]) # retorna o padrão dos [], uma matriz

# 13. Partial matching
x = list(aaasddsddssadsda = 1:5)
x$a # consegue achar a coluna pela começo do nome
x[["a", exact = F]]  # consegue achar a coluna pela começo do nome usando um parâmetro extra


# 13. Removing NA
x = c(1,2,3,NA,5,NA,7)
bad = is.na(x)
x[!bad] # passando um vetor booleano y como parâmetro retorna todos os values equivalentes aos T de y em x

good = complete.cases(x) # faz o mesmo
x[good]

# 14. Vectorized Operations

x = 1:10
y = 1:10
x * 2
x + y
x > 5
x / 2
x == y # T


m1 = matrix(1:4, nrow = 2, ncol =2)
m2 = matrix(1:4, nrow = 2, ncol =2)
m1 * m2 # multiplica elemento por elemento, assim como em vetores e listas
m1 %*% m2 # faz de fato a multiplicação de matrizes

 # Comandos
a = 1
b = 2
rm(a,b) # exclui variáveis

