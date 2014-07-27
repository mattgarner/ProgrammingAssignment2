##This function computes the inverse of the special "matrix" returned by makeCacheMatrix. 
##If the inverse has already been calculated (and the matrix has not changed), 
##then the cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        #Get the cached value for inverse matrix which is stored in makeCacheMatrix object x
        i <- x$getinv()
        
        #If a cached result was found, then return it, and acknowledge that it is a cached value
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        
        #Obtain matrix data from object x
        data <- x$get()
        #Calculate the inverse of the matrix
        i <- solve(data, ...)
        #Cache the result of the calculation within object x
        x$setinv(i)
        #return the newly calculated inverse matrix i
        i
}