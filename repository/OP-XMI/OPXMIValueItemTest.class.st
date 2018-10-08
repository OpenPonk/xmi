Class {
	#name : #OPXMIValueItemTest,
	#superclass : #TestCase,
	#category : 'OP-XMI-Tests'
}

{ #category : #tests }
OPXMIValueItemTest >> testConstructorAttribute [
	| element |
	element := OPXMIValueAttribute xmiName: 'NAME' value: 'VALUE'.
	self assert: element xmiName equals: 'NAME'.
	self assert: element value equals: 'VALUE'
]

{ #category : #tests }
OPXMIValueItemTest >> testConstructorElement [
	|element|
	element := OPXMIValueElement xmiName: 'NAME' value: 'VALUE'.
	self assert: element xmiName equals: 'NAME'.
	self assert: element value equals: 'VALUE'
]
