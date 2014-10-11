## These functions are used to cache a matrix and its inverse. You get a list
## of functions to work with which you can get a cached matrix and inverse, as
## as well as set them. You also have a function which will get the inverse of
## cached matrix and return it (either from the cache if available or by 
## solve() functionf. 

## Creates a list of functions. one to set matrix in cache, one to get cached
## matrix, one to set inverse in cache to specific value, and one to get said
## cached inverse. 
## Returns list. 

makeCacheMatrix <- function(x = matrix()) {
  m<- NULL  
  set <- function(y) { 
    x<<-y
    m<-NULL}
  get <-function() x   
  setinverse<-function(inver) m<<- inver
  getinverse<-function() m    
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## Uses getinverse above to get inverse and, if its null, uses solve() function
## in function with get() function above to set inverse with setinverse().  
## Returns inverse of matrix.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()   
  if (is.null(m)) {     
    m<-x$setinverse(solve(x$get()))
  }
  return(m)
}
