GTInspector-Extensions
gtInspectorPropertiesIn: aComposite
	<gtInspectorPresentationOrder: 5>
	aComposite table
		title: 'Properties';
		display: [ self containedItems select: [ :each | each isValueAttribute | each isValueElement ] ];
		column: 'xmiName' evaluated: [ :each | each xmiName ];
		column: 'value' evaluated: [ :each | each value ]