for (name in uniqueNames) {
	list [[ name]] <- mean( table[ table$name ~ name,2 ] )
}