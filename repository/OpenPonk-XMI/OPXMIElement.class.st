Class {
	#name : 'OPXMIElement',
	#superclass : 'OPXMIInfoItems',
	#instVars : [
		'xmiName'
	],
	#category : 'OpenPonk-XMI-DOM',
	#package : 'OpenPonk-XMI',
	#tag : 'DOM'
}

{ #category : 'testing' }
OPXMIElement class >> isAbstract [
	^ self = OPXMIElement
]

{ #category : 'testing' }
OPXMIElement >> isElement [
	^ true
]

{ #category : 'accessing' }
OPXMIElement >> xmiName [
	^ xmiName
]

{ #category : 'accessing' }
OPXMIElement >> xmiName: aString [
	xmiName := aString
]
