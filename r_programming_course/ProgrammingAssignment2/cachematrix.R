## The purpose of these functions are to cut down on repitition of creating inverse of a matrix.
## These will cache a matrix and its inverse so that R can just recall the cache versions for furture uses

## This function creates the cache of the matrix

makeCacheMatrix <- function(mat = matrix()) {
  matInv  <- NULL
  set     <- function(newMat) {
    mat     <<- newMat
    matInv  <<- NULL
  }
  get         <- function() mat
  setInverse  <- function(inverse) matInv <- inverse
  getInverse  <- function() matInv
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


##Creates the cache inverse if there is not already one and if there is a cache, calls it

cacheSolve <- function(mat, ...) {
  matInv <- mat$getInverse()
  if(!is.null(matInv)){
    message("getting cached data")
    return(matInv)
  }
  matData <- mat$get()
  matInv  <- solve(matData, ...)
  mat$setInverse(matInv)
  matInv
}