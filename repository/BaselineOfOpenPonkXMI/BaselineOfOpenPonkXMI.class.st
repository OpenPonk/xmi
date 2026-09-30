"
Baseline for https://github.com/OpenPonk/xmi
"
Class {
	#name : 'BaselineOfOpenPonkXMI',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfOpenPonkXMI',
	#package : 'BaselineOfOpenPonkXMI'
}

{ #category : 'baselines' }
BaselineOfOpenPonkXMI >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			baseline: 'OpenPonkXMLDOMVisitor'
			with: [
			spec repository: 'github://openponk/xml-dom-visitor:v5.0.0' ].
		spec baseline: 'XMLWriter' with: [
			spec
				loads: #( 'Core' );
				repository:
					'github://pharo-contributions/XML-XMLWriter:v3.1.x/src' ].
		spec
			package: 'OpenPonk-XMI'
			with: [ spec requires: #( 'OpenPonkXMLDOMVisitor' 'XMLWriter' ) ].
		spec
			package: 'OpenPonk-XMI-Inspection'
			with: [ spec requires: #( 'OpenPonk-XMI' ) ].
		spec group: 'default' with: #( 'OpenPonk-XMI' 'OpenPonk-XMI-Inspection' ) ]
]
