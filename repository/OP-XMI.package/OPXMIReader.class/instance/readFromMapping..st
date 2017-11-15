instance creation
readFromMapping: aMapping
	| graphs |
	graphs := OrderedDictionary new.
	aMapping keysAndValuesDo: [ :key :value | graphs at: key put: (self readFrom: value) ].
	graphs valuesDo: [ :root | self resolveHrefsIn: root with: graphs ].
	^ graphs