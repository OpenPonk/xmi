instance creation
resolveHrefsIn: anElement with: aMapping
	anElement isReferenceItem
		ifTrue: [ ^ self resolveHrefIn: anElement with: aMapping ].
	anElement isObjectElement
		ifFalse: [ ^ self ].
	anElement containedItems do: [ :each | self resolveHrefsIn: each with: aMapping ]