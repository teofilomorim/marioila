## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function creates a special matrix object that 
## can cache its inverse.  

makeCacheMatrix <- function(x = matrix()) {
  inv = NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<-inverse
  getinverse <- function() inv
  list(set=set,
       get=get,
       setinverse=setinverse,
       getinverse=getinverse)

}


## Write a short comment describing this function

## This function can calculate the inverse of the 
## special matrix object created by the makeCacheMatrix 
## function above. Before calculating the inverse,
## the function checks if it was already calculated 
## and present in the cache of the program. If so 
## the function retrieves the inverse from the cache. 

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setinverse(inv)
  inv
        ## Return a matrix that is the inverse of 'x'
}
