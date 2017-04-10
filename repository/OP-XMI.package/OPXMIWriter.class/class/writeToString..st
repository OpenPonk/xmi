writing
writeToString: anXMI
	^ String streamContents: [ :stream | self write: anXMI to: stream ]