Class {
	#name : #OPXMIObjectElementTest,
	#superclass : #TestCase,
	#category : 'OP-XMI-Tests'
}

{ #category : #'instance creation' }
OPXMIObjectElementTest >> nestedObjects [
	^ OPXMIObjectElement new
		xmiName: 'aaa';
		containedItems:
			{OPXMIValueAttribute new
				xmiName: 'xmi:id';
				value: 'AAA'.
			OPXMIObjectElement new
				xmiName: 'bbb';
				containedItems:
					{OPXMIValueAttribute new
						xmiName: 'xmi:id';
						value: 'BBB'}.
			OPXMIObjectElement new
				xmiName: 'ccc';
				containedItems:
					{OPXMIValueAttribute new
						xmiName: 'xmi:id';
						value: 'CCC'.
					OPXMIObjectElement new
						xmiName: 'ddd';
						containedItems:
							{OPXMIValueAttribute new
								xmiName: 'xmi:id';
								value: 'DDD'}}}
]

{ #category : #tests }
OPXMIObjectElementTest >> testElementNamed [
	| el |
	(el := OPXMIObjectElement new)
		xmiName: 'container';
		containedItems: {OPXMIObjectElement new xmiName: 'element'}.
	self assert: (el elementNamed: 'element') xmiName equals: 'element'.
	self assert: (el elementNamed: 'none') equals: nil
]

{ #category : #tests }
OPXMIObjectElementTest >> testFindElementWithXmiId1 [
	| root result |
	root := self nestedObjects.
	result := root findElementWithXmiId: 'AAA'.
	self assert: result equals: root
]

{ #category : #tests }
OPXMIObjectElementTest >> testFindElementWithXmiId2 [
	| root result |
	root := self nestedObjects.
	result := root findElementWithXmiId: 'BBB'.
	self assert: result xmiName equals: 'bbb'
]

{ #category : #tests }
OPXMIObjectElementTest >> testFindElementWithXmiId3 [
	| root result |
	root := self nestedObjects.
	result := root findElementWithXmiId: 'CCC'.
	self assert: result xmiName equals: 'ccc'
]

{ #category : #tests }
OPXMIObjectElementTest >> testFindElementWithXmiId4 [
	| root result |
	root := self nestedObjects.
	result := root findElementWithXmiId: 'DDD'.
	self assert: result xmiName equals: 'ddd'
]

{ #category : #tests }
OPXMIObjectElementTest >> testFindElementWithXmiId5 [
	| root result |
	root := self nestedObjects.
	result := root findElementWithXmiId: 'EEE'.
	self assert: result equals: nil
]

{ #category : #tests }
OPXMIObjectElementTest >> testId [
	| element |
	element := OPXMIObjectElement new.
	self assert: element xmiId equals: nil.
	element
		containedItems:
			{OPXMIValueAttribute new
				xmiName: #xmi:id;
				value: 'ID'}.
	self assert: element xmiId equals: 'ID'
]

{ #category : #tests }
OPXMIObjectElementTest >> testNameValue [
	| element |
	element := OPXMIObjectElement new
		containedItems: {OPXMIValueElement xmiName: 'name' value: 'hello'}.
	self assert: element nameValue equals: 'hello'.
	self should: [ OPXMIObjectElement new nameValue ] raise: NotFound
]

{ #category : #tests }
OPXMIObjectElementTest >> testType [
	| element |
	element := OPXMIObjectElement new.
	self assert: element xmiType equals: nil.
	element
		containedItems:
			{OPXMIValueAttribute new
				xmiName: #xmi:type;
				value: 'TYPE'}.
	self assert: element xmiType equals: 'TYPE'
]
