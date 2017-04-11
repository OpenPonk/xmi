factory
isReferenceAttribute: aXMLAttribute
	(aXMLAttribute parent isNotNil
		and: [ aXMLAttribute value = (self elementAt: aXMLAttribute parent) xmiId ])
		ifTrue: [ ^ false ].
	aXMLAttribute prefix = 'xmi'
		ifTrue: [ ^ false ].
	^ (aXMLAttribute value splitOn: ' ')
		allSatisfy: [ :each | refIdMapping includesKey: each ]