searching
findElementWithXmiId: aXmiId
	self xmiId = aXmiId
		ifTrue: [ ^ self ].
	self containedItems
		select: #isObjectElement
		thenDo: [ :each | (each findElementWithXmiId: aXmiId) ifNotNil: [ :match | ^ match ] ].
	^ nil