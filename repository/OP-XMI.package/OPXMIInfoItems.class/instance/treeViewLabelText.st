GTInspector-Extensions
treeViewLabelText
	^ self asHighlightedTextWrittenWith: [ :writer | self writeTreeViewLabelXMLOn: writer ]