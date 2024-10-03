"
Baseline for https://github.com/OpenPonk/xmi
"
Class {
	#name : 'BaselineOfOPXMI',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfOPXMI',
	#package : 'BaselineOfOPXMI'
}

{ #category : 'baselines' }
BaselineOfOPXMI >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			baseline: 'XMLDOMVisitor'
			with: [
			spec repository: 'github://OpenPonk/xml-dom-visitor:v4.0.x' ].
		spec baseline: 'XMLWriter' with: [
			spec
				loads: #( 'Core' );
				repository:
					'github://pharo-contributions/XML-XMLWriter:v3.1.1' ].
		spec
			package: 'OP-XMI'
			with: [ spec requires: #( 'XMLDOMVisitor' 'XMLWriter' ) ].
		spec
			package: 'OP-XMI-GTExtensions'
			with: [ spec requires: #( 'OP-XMI' ) ].
		spec group: 'default' with: #( 'OP-XMI' 'OP-XMI-GTExtensions' ) ]
]
