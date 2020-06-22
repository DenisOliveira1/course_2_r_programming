# 1. if else
x = 3
if (x < 3){
        print("x < 3")
} else if (x < 3){
        print("x < 3")
} else{
        print("x = 3")
}

# 2. for
for(i in 1:10){
        print(i)
}

x = 1:5
for(i in 1:length(x)){
        print(x[i])
}

for(i in seq_len(10)){
        print(i)
}

for(i in x){
        print(i)
}

for(i in x) print(i)

x = matrix(1:10, nrow=2, ncol = 5)

for(i in seq_len(nrow(x))){
        for(j in seq_len(ncol(x))){
                print(x[i,j])
        }
}

# 3. while

i = 1
while(i < 10){
        print(i)
        i = i + 1
}

# 4. repeat e break

i = 1
repeat{
        print(i)
        if (i == 10) {
                break # para de fazer iterações
        }
        i = i + 1
}

# next

for (i in 1:30){
        if (i < 20){
                next # vai pra proxima iteração
        }
        print(i)
}

# 5. functions
# funções podem ser declaradas dentro de outras funções 
# funções podem ser passadas como argumentos para outras funções

add2 = function(x,y){
        x+y
}

above10 = function(x){
        x[x > 10]
}

above = function(x, n=10){
        x[x > n]
}

columnMean = function(y, removeNA = T){
        nc = ncol(y)
        means = c()
        for(i in 1:nc){
                means[i] = mean(y[,i], na.rm = removeNA)
        }
        means # funciona como um return
}

add2(5,6)
above10(c(1:20))
above(c(1:20))
above(c(1:20),15)
columnMean(airquality)

# 6. Scoping

z=3 # procurar aqui depois
add3 = function(x,y){
        # z = 1 # procurar aqui primeiro
        x+y+z
}
add3(5,5)

make.power = function(n){
        pow = function(x){
                x^n
        }
}

square = make.power(2)
cube = make.power(3)

# ao chamar a função make n é informado e a funçao é criada e retornada
# para a função retornada o número que é informado é o x
square(2)
cube(2)

ls(environment(make.power)) # o ambiente dessa função é o global
ls(environment(cube)) # o ambiente dessa função é o interior do make.power, onde foi criada
get("n", environment(cube)) # acessa a variabel dentro do ambiente informado

y = 10
f = function(x){
        y = 2
        y^2+ g(x) # 2^2 + g(10) = 4 + 10*x
}
g = function(x){
        x*y
}

f(3)

# 6. Dates e Times

x = as.Date("1970-01-01")
unclass(x) # Dias desde 01/01/1970
x = as.Date("1970-01-02")
unclass(x) # Dias desde 01/01/1970

x = Sys.time()
p = as.POSIXlt(x)
unclass(p)
names(unclass(p))
p$hour
p$min
p$sec

x = Sys.time()
p = as.POSIXct(x)
unclass(p) # milisegundos desde 01/01/1970 

as.Date("2012-03-01") - as.Date("2012-02-28") # diferença em dias
as.POSIXct("2012-10-25 06:00:00") - as.POSIXct("2012-10-25 01:00:00" ) # diferença em horas