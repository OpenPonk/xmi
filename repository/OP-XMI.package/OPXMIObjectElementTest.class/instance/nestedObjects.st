instance creation
nestedObjects
	^ OPXMIObjectElement new
		xmiName: 'aaa';
		containedItems:
			{OPXMIValueAttribute new
				xmiName: 'xmi:id';
				value: 'AAA'.
			OPXMIObjectElement new
				xmiName: 'bbb';
				containedItems:
					{OPXMIValueAttribute new
						xmiName: 'xmi:id';
						value: 'BBB'}.
			OPXMIObjectElement new
				xmiName: 'ccc';
				containedItems:
					{OPXMIValueAttribute new
						xmiName: 'xmi:id';
						value: 'CCC'.
					OPXMIObjectElement new
						xmiName: 'ddd';
						containedItems:
							{OPXMIValueAttribute new
								xmiName: 'xmi:id';
								value: 'DDD'}}}