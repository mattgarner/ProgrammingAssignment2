##This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
	  #i is inverse of x, is unknown when object created
	  i <- NULL
	 
	  #The set function assigns a new value to x (the matrix). If a new value
	  #of x is set then the value of i is set to NULL, since previously calculated values
    #will be incorrect if the new matrix values differ from the old ones
    set <- function(y) {
            x <<- y
            i <<- NULL
    }
	  
    #get returns the value of x within the object
    get <- function() x
        
    #setinv is called by cacheSolve.R to assign it's result to i, the cached inverse
    setinv <- function(inv) i <<- inv
        
	  #getinv returns the inverse of x (will be NULL before cacheSolve is called on the 
    #makeCacheMatrix object)
    getinv <- function() i
        
	  #Items to display when a makeCacheMatrix object is called
	  list(set = set,
         get = get,
         setinv = setinv,
         getinv = getinv)
}