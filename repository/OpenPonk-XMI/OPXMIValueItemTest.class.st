"
I am a unit test class verifying the instantiation, initialization, and value assignment of XMI value attributes and elements.
"
Class {
	#name : 'OPXMIValueItemTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-XMI-Tests',
	#package : 'OpenPonk-XMI',
	#tag : 'Tests'
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
