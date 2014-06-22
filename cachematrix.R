## These two functions are used together to calculate the inverse of a matrix.
##  Assuming the matrix does not change, the value is cached, preventing
##  the need to recalculate the matrix inverse more than once.

## makeCacheMatrix creates a list containing functions to set/get a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL  # The matrix inverse
    set <- function(y) {  # Store the matrix, for later retrieval by get()
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse)  i <<- inverse
    getinverse <- function()  i
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## cacheSolve calculates the inverse of the special matrix created with makeCacheMatrix

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if (!is.null(i)) {
        message("getting cached data")
        return(i)  # Already cached - no need to recalculate
    }
    else {
        message("calculating inverse")
    }
    mat <- x$get()
    i <- solve(mat)
    x$setinverse(i)  # Cache the inverse for subsequent calls
    i
}
