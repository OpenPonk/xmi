baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				project: 'XMLParser'
				with: [ spec
						className: #ConfigurationOfXMLParser;
						versionString: #stable;
						repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLParser/main/' ].
			spec
				baseline: 'XMLDOMVisitor'
				with: [ spec repository: 'github://peteruhnak/xml-dom-visitor/repository' ].
			spec package: 'OP-XMI' with: [ spec requires: #('XMLParser' 'XMLDOMVisitor') ].
			spec group: 'default' with: #('OP-XMI') ]