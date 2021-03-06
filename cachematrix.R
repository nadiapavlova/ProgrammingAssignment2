## Caching the Inverse of a Matrix
## Matrix inversion is usually a costly computation and there may be some
## benefit to caching the inverse of a matrix rather than compute it repeatedly.
## Below are pairs of functions that are used to create a special object that 
## stores a matrix and caches its inverse.

## The function creates a special "matrix" that can cache its inverse
## It creates a list containing a function to (set the value of the matrix,
## get the value of the matrix, set the value of the inverse, and 
## get the value of the inverse)

makeCacheMatrix <- function(x = matrix(x=matrix())) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<-NULL
  
  }
  
  get <-function()x
  setInverse <- function(inverse) inv <<-inverse
  getInverse <- function() inv
  list (set=set, get=get,
    setInverse=setInverse,
    getInverse=getInverse)
}


## The function calculates the inverse of the special matrix created
## with the funciton above.  If the inverse has already been calculated,
## and the matrix has not changed, then it should retrieve the inverse from 
## the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverser of "x"
  inv <-x$getInverse()
  if(!is.null(inv)){
    message ("getting cached data")
    return(inv)
  }
       
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
   
}
