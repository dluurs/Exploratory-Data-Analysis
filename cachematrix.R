## Coursera.org / John Hopkins Data Science
## Class: rprog-016
## Programming Assignment # 2
## Assignment: Caching the Inverse of a Matrix

## makeCacheMatrix
##
## This function creates a special "matrix" object that can cache its inverse.
## Function works similar to OOP GET and SET methods
## 

makeCacheMatrix <- function(x = matrix()) {
  tmp_x <- NULL 
  
  get <- function() {
    x 
  }
  
  getInverse <- function() {
    tmp_x
  }

  set <- function(y) {
    x <<- y
    tmp_x <<- NULL 
  }
  
  setInverse <- function(z) {
    tmp_x <<- z 
  }
  
  list(get = get,
       getInverse = getInverse,
       set = set,
       setInverse = setInverse)
}

## cacheSolve
##
## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then the cachesolve should retrieve 
## the inverse from the cache.

cacheSolve <- function(x, ...) {
      holding <- x$getInverse() 

      if(!is.null(holding)) { 
        message("Getting Cached Data")
        return(holding) 
      }
      
      data <- x$get() 
      holding <- solve(data)
      x$setInverse(holding) 
      holding 
}
