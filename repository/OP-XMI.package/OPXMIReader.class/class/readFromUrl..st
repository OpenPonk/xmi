instance creation
readFromUrl: aUrl
	^ self readFrom: (ZnEasy get: aUrl) entity readStream contents