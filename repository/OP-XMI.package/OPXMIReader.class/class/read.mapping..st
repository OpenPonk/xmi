instance creation
read: aStream mapping: aMapping
	aMapping at: 'result' put: aStream contents.
	^ (self readFromMapping: aMapping) at: 'result'