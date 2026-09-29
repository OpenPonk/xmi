"
I am the abstract base class for XMI attributes. I hold the XMI name of the attribute.
"
Class {
	#name : 'OPXMIAttribute',
	#superclass : 'OPXMIInfoItems',
	#instVars : [
		'xmiName'
	],
	#category : 'OpenPonk-XMI-DOM',
	#package : 'OpenPonk-XMI',
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
