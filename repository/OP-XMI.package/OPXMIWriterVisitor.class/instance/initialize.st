initialization
initialize
	super initialize.
	writer := XMLWriter new.
	writer
		enablePrettyPrinting;
		xml.