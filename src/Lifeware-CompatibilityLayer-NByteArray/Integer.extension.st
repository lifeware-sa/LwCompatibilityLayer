Extension { #name : #Integer }

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
Integer >> asByteArrayInto: aByteArray length: aNumber [

	| offset |
	offset := aNumber + 1.
	1 to: aNumber do: [ :each | 
	aByteArray at: offset - each put: (self byteValueAt: each) ]
]

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
Integer >> asByteArrayInto: aByteArray startingAt: aNumber length: bNumber [

	| offset |
	offset := bNumber + aNumber.
	1 to: bNumber do: [ :each | 
	aByteArray at: offset - each put: (self byteValueAt: each) ]
]

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
Integer >> asByteArraySize: aNumber [

	| array offset |
	offset := aNumber + 1.
	array := ByteArray withSize: aNumber.
	1 to: aNumber do: [ :each | 
	array at: offset - each put: (self byteValueAt: each) ].
	^ array
]

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
Integer >> asFourByteArray [

	^ ByteArray
		  with: (self byteValueAt: 4)
		  with: (self byteValueAt: 3)
		  with: (self byteValueAt: 2)
		  with: (self byteValueAt: 1)
]

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
Integer >> asFourBytes [

	"This is platform-independent. It regards the receiver as a two's-complement
	infinite-precision binary number, which is the same on all platforms."

	^ ByteArray
		  with: (self byteValueAt: 1)
		  with: (self byteValueAt: 2)
		  with: (self byteValueAt: 3)
		  with: (self byteValueAt: 4)
]

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
Integer >> asNByteArray [

	^ self asNByteArrayPadTo: nil
]

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
Integer >> asNByteArrayPadTo: anIntegerOrNil [

	| stream number bytes |
	self < 0 ifTrue: [ ^ nil error: 'cannot be negative' ].
	bytes := ByteArray new: 4.
	stream := bytes writeStream.
	number := self.
	[ number > 0 ] whileTrue: [ 
		stream nextPut: number \\ 256.
		number := number // 256 ].
	anIntegerOrNil ifNotNil: [ 
		(anIntegerOrNil - stream contentsSize max: 0) timesRepeat: [ 
			stream nextPut: 0 ] ].
	^ stream contents reverse
]

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
Integer >> asThreeByteArray [

	^ ByteArray
		  with: (self byteValueAt: 3)
		  with: (self byteValueAt: 2)
		  with: (self byteValueAt: 1)
]

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
Integer >> asTwoBytes [

	^ ByteArray with: (self byteValueAt: 1) with: (self byteValueAt: 2)
]

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
Integer >> byteValueAt: anIndex [

	"This is platform-independent. It regards the receiver as a two's-complement
	infinite-precision binary number, which is the same on all platforms."

	^ (anIndex = 1
		   ifTrue: [ self ]
		   ifFalse: [ self bitShift: 8 - (anIndex bitShift: 3) ]) bitAnd:
		  255
]

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
Integer class >> fromByteArray: aByteArray [

	^ aByteArray inject: 0 into: [ :sum :each | sum * 256 + each ]
]
