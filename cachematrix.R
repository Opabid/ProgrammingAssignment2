## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setmatinv <- function(solve) m <<- solve
    getmatinv <- function() m
    list(set = set, get = get,
         setmatinv = setmatinv,
         getmatinv = getmatinv)
    
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    matinv<-x$getmatinv()
    
    if(!is.null(matinv)) {
        message("getting cached data")
        return(matinv)
    }
    data <- x$get()
    matinv <- solve(data)
    x$setmatinv(matinv)
    matinv
}
t<- matrix(1:4,nrow=2)
t_1 <- cacheSolve(makeCacheMatrix(t))
