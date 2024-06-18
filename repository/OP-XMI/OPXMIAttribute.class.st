Class {
	#name : 'OPXMIAttribute',
	#superclass : 'OPXMIInfoItems',
	#instVars : [
		'xmiName'
	],
	#category : 'OP-XMI-DOM',
	#package : 'OP-XMI',
	#tag : 'DOM'
}

{ #category : 'testing' }
OPXMIAttribute class >> isAbstract [
	^ self = OPXMIAttribute
]

{ #category : 'testing' }
OPXMIAttribute >> isAttribute [
	^ true
]

{ #category : 'accessing' }
OPXMIAttribute >> xmiName [
	^ xmiName
]

{ #category : 'accessing' }
OPXMIAttribute >> xmiName: aString [
	xmiName := aString
]
