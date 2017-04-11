instance creation
resolveHrefIn: aReferenceElement with: aMapping
	| parts |
	parts := aReferenceElement href splitOn: '#'.
	aMapping
		at: parts first
		ifPresent: [ :root | aReferenceElement referencedElements: {root findElementWithXmiId: parts second} ]