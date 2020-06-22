makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

achemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}

# media esta como null em a
a = makeVector(1:5)
a$get()
a$set(1:10)
a$get()
a$setmean
a$getmean()

# como o valor não esta dentro de a ele é calculado
# é possivel setar um valor dentro de a porque a função set em a tem <<-
# alem de colocar o valor calculado no a ainda devolve esse valor
m = achemean(a)

# depois de executada uma vez m é setada em a e agora b não precisa calcular ela, pode pegar de a
m = achemean(a)
