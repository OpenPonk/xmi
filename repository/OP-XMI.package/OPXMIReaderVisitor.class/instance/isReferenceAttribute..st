factory
isReferenceAttribute: aXMLAttribute
	aXMLAttribute prefix = 'xmi'
		ifTrue: [ ^ false ].
	^ (aXMLAttribute value splitOn: ' ') allSatisfy: [ :each | refIdMapping includesKey: each ]