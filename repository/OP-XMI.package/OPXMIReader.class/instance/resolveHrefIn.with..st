instance creation
resolveHrefIn: aReferenceItem with: aMapping
	| parts |
	parts := aReferenceItem href splitOn: '#'.
	aMapping
		at: parts first
		ifPresent: [ :root | aReferenceItem referencedElements: {root findElementWithXmiId: parts second} ]