## Matrix inversion is usually a costly computation
## Given below are 2 functions that cache the inverse of a matrix

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  matrixinv <- NULL
  set <- function(y) {
    x <<- y
    matrixinv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) matrixinv <<- inverse
  getinverse <- function() matrixinv
  list(set=set, get=get, 
       setinverse=setinverse, 
       getinverse=getinverse)
}



## The function below computes the inverse of the special matrix returned by makeCacheMatrix above. 
## If the inverse already exists in the cache "matrixinv", then the "cacheSolve" function should retrieve the 
## inverse from it. 
## If not, it computes the inverse and captures the value in the cache "matrixinv" through the "setinverse" function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        matrixinv <- x$getinverse()
        if(!is.null(matrixinv)) {
          message("getting cached data")
          return(matrixinv)
          }
  matrixdata <- x$get()
  matrixinv <- solve(matrixdata)
  x$setinverse(matrixinv)
  matrixinv
}

## > test <- makeCacheMatrix(matrix(rnorm(100),2,2))
## > cacheSolve(test)
##          [,1]      [,2]
## [1,]  5.005002 -1.258603
## [2,] -5.385942  2.192165
## > test$getinverse()
##          [,1]      [,2]
## [1,]  5.005002 -1.258603
## [2,] -5.385942  2.192165
## > cacheSolve(test)
## getting cached data
##          [,1]      [,2]
## [1,]  5.005002 -1.258603
## [2,] -5.385942  2.192165
