visiting
visitElement: aXMLElement
	| element |
	element := self elementFor: aXMLElement.
	mapping at: aXMLElement put: element.
	mapping at: aXMLElement parent ifPresent: [ :parent | parent containedItems add: element ].
	element isObjectElement
		ifTrue: [ refIdMapping at: element xmiId put: element ].
	super visitElement: aXMLElement