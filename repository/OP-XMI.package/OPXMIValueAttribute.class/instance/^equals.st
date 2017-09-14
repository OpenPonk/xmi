comparing
= aValueAttribute
	self species = aValueAttribute species
		ifFalse: [ ^ false ].
	self xmiName = aValueAttribute xmiName
		ifFalse: [ ^ false ].
	self value = aValueAttribute value
		ifFalse: [ ^ false ].
	^ true