Class {
	#name : #OPXMIElement,
	#superclass : #OPXMIInfoItems,
	#instVars : [
		'xmiName'
	],
	#category : 'OP-XMI-DOM'
}

{ #category : #testing }
OPXMIElement class >> isAbstract [
	^ self = OPXMIElement
]

{ #category : #testing }
OPXMIElement >> isElement [
	^ true
]

{ #category : #accessing }
OPXMIElement >> xmiName [
	^ xmiName
]

{ #category : #accessing }
OPXMIElement >> xmiName: aString [
	xmiName := aString
]
