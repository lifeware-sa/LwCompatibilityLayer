Extension { #name : #ByteArrayTest }

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
ByteArrayTest >> testFromFourBytes [

	self assert: #[ 65 66 67 68 ] fromFourBytes equals: 1145258561
]

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
ByteArrayTest >> testFromTwoBytes [

	self assert: #[ 65 66 ] fromTwoBytes equals: 16961
]
