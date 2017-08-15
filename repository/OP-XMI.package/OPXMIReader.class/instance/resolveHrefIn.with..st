instance creation
resolveHrefIn: aReferenceItem with: aMapping
	| parts ref |
	aReferenceItem href ifNil: [ ^ self ].
	parts := aReferenceItem href splitOn: '#'.
	self flag: 'hack to circumvent package imports which are not properly resolved yet'.
	aMapping
		at: parts first
		ifPresent: [ :root | ref := root findElementWithXmiId: parts second ].
	(ref isNil
		and:
			[ aReferenceItem isReferenceElement and: [ aReferenceItem xmiType = 'uml:PrimitiveType' ] ])
		ifTrue: [ aMapping values
				detect: [ :root | (root findElementWithXmiId: parts second) isNotNil ]
				ifFound: [ :root | ref := root findElementWithXmiId: parts second ] ].
	"	ref ifNil: [ self error: 'Unable to resolve a reference.' ]."
	ref ifNotNil: [ aReferenceItem referencedElements: {ref} ]