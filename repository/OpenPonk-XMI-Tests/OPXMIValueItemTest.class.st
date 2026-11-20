"
I am a unit test class verifying the instantiation, initialization, and value assignment of XMI value attributes and elements.
"
Class {
	#name : 'OPXMIValueItemTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-XMI-Tests-DOM',
	#package : 'OpenPonk-XMI-Tests',
	#tag : 'DOM'
}

{ #category : 'tests' }
OPXMIValueItemTest >> testConstructorAttribute [
	| element |
	element := OPXMIValueAttribute xmiName: 'NAME' value: 'VALUE'.
	self assert: element xmiName equals: 'NAME'.
	self assert: element value equals: 'VALUE'
]

{ #category : 'tests' }
OPXMIValueItemTest >> testConstructorElement [
	|element|
	element := OPXMIValueElement xmiName: 'NAME' value: 'VALUE'.
	self assert: element xmiName equals: 'NAME'.
	self assert: element value equals: 'VALUE'
]

{ #category : 'tests' }
OPXMIValueItemTest >> testPrintOn [

	| attribute |
	attribute := OPXMIValueAttribute xmiName: 'key' value: 'val'.
	self assert: attribute printString equals: 'XMIValueAttribute(key="val")'.
	self assert: OPXMIValueAttribute new printString equals: 'XMIValueAttribute(="")'
]

{ #category : 'tests' }
OPXMIValueItemTest >> testTypePredicates [

	| attribute element |
	attribute := OPXMIValueAttribute new.
	self assert: attribute isAttribute description: 'Value attribute must be an attribute'.
	self assert: attribute isValueAttribute description: 'Value attribute must report isValueAttribute'.
	self assert: attribute isValueItem description: 'Value attribute must report isValueItem'.
	self deny: attribute isElement description: 'Value attribute must not be an element'.
	self deny: attribute isValueElement description: 'Value attribute must not be a value element'.
	self deny: attribute isReferenceItem description: 'Value attribute must not be a reference item'.
	element := OPXMIValueElement new.
	self assert: element isElement description: 'Value element must be an element'.
	self assert: element isValueElement description: 'Value element must report isValueElement'.
	self assert: element isValueItem description: 'Value element must report isValueItem'.
	self deny: element isAttribute description: 'Value element must not be an attribute'.
	self deny: element isValueAttribute description: 'Value element must not be a value attribute'.
	self deny: element isReferenceItem description: 'Value element must not be a reference item'
]

{ #category : 'tests' }
OPXMIValueItemTest >> testValueAttributeEqualityAndHash [

	| first same differentName differentValue valueElement |
	first := OPXMIValueAttribute xmiName: 'key' value: 'val'.
	same := OPXMIValueAttribute xmiName: 'key' value: 'val'.
	differentName := OPXMIValueAttribute xmiName: 'other' value: 'val'.
	differentValue := OPXMIValueAttribute xmiName: 'key' value: 'other'.
	valueElement := OPXMIValueElement xmiName: 'key' value: 'val'.
	self assert: first equals: same.
	self assert: first hash equals: same hash.
	self deny: first equals: differentName.
	self deny: first equals: differentValue.
	self deny: first equals: valueElement
]
