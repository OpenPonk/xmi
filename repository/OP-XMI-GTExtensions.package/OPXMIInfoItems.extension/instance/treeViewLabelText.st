*OP-XMI-GTExtensions
treeViewLabelText
	^ self asHighlightedTextWrittenWith: [ :writer | self writeTreeViewLabelXMLOn: writer ]