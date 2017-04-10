accessing
containedItem
	^ containedItems ifEmpty: [ ^ nil ] ifNotEmpty: #first