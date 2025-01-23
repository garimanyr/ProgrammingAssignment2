## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL  # Initialize the inverse as NULL
# Function to set the matrix
set <- function(y) {
x <<- y
inv <<- NULL  # Reset the inverse cache when the matrix is updated
}
# Function to get the matrix
get <- function() x
# Function to set the inverse
setInverse <- function(inverse) inv <<- inverse
# Function to get the cached inverse
getInverse <- function() inv
# Return a list of the above functions
list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()  # Retrieve the cached inverse
# If the inverse is already cached, return it
if (!is.null(inv)) {
message("Getting cached inverse")
return(inv)
}
# If the inverse is not cached, compute it
mat <- x$get()
inv <- solve(mat, ...)  # Compute the inverse using solve()
x$setInverse(inv)       # Cache the computed inverse
inv
}
# Create a special "matrix" object
mat <- matrix(c(4, 7, 2, 6), nrow = 2, ncol = 2)
specialMatrix <- makeCacheMatrix(mat)
# Compute the inverse (not cached yet)
inverse1 <- cacheSolve(specialMatrix)
print(inverse1)
# Retrieve the cached inverse
inverse2 <- cacheSolve(specialMatrix)
print(inverse2)
}
