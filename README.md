# XMI
[![Build Status](https://travis-ci.org/OpenPonk/xmi.svg?branch=master)](https://travis-ci.org/OpenPonk/xmi) [![Coverage Status](https://coveralls.io/repos/github/OpenPonk/xmi/badge.svg?branch=master)](https://coveralls.io/github/OpenPonk/xmi?branch=master)

WIP implementation of XMI graph representation in Pharo.

[OMG XMI 2.5.1 Specs](http://www.omg.org/spec/XMI/2.5.1/)

## Installation

```smalltalk
Metacello new
	baseline: 'OPXMI';
	repository: 'github://OpenPonk/xmi/repository';
	load.
```

## Basic Usage

### Materialization

![](figures/fromUrl.png)

```smalltalk
root := OPXMIReader readFromUrl: 'http://www.omg.org/spec/XMI/20131001/XMI-model.xmi'.
root := OPXMIReader readFromFile: '/home/user/XMI-model.xmi' asFileReference.
root := OPXMIReader readFrom: aReadStream.
```


![](figures/reference.png)
A reference element in the XML is converted into a direct reference to the target element.


### HREF resolution

XMI supports referencing other elements in the document *(xmi:idref and attribute="idRef" handled automatically)* as well as in other documents; we handle this via mapping.

**NOTE:** *the key of the mapping has to be equal to the referenced URI*

`AA.xmi`
```xml
<container>
	<aaItem xmi:id="AAX">
		<bee href="BB.xmi#BBX" />
	</aaItem>
</container>
```

`BB.xmi`
```xml
<container>
	<bbItem xmi:id="BBX" />
</container>
```

```smalltalk
"the order doesn't matter"
mapping := Dictionary
		with: 'AA.xmi' -> 'AA.xmi' asFileReference contents
		with: 'BB.xmi' -> 'BB.xmi' asFileReference contents
resultMapping := OPXMIReader readFromMapping: mapping.

aaItem := (resultMapping at: 'AA.xmi') containedItems first.
bbItem := (resultMapping at: 'BB.xmi') containedItems first.
self assert: aaItem containedItems second referencedElement equals: bbItem.
```





### Serialization

A XMI graph can be converted back into a XML file with writer.

```smalltalk
xmiGraph := OPXMIReader readFromUrl: 'http://www.omg.org/spec/XMI/20131001/XMI-model.xmi'.
xmlString := OPXMIWriter writeToString: root.
```

See tests and XMI specs for usage.
