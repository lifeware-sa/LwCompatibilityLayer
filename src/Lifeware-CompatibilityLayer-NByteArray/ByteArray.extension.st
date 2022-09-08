Extension { #name : #ByteArray }

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
ByteArray >> fromFourBytes [

	^ (self at: 1) + ((self at: 2)
	   + ((self at: 3) + ((self at: 4) bitShift: 8) bitShift: 8) 
		   bitShift: 8)
]

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
ByteArray >> fromNBytes [

	| count result mySize |
	count := 1.
	mySize := self size.
	mySize isZero ifTrue: [ ^ 0 ].
	result := self at: count.

	[ 
	count := count + 1.
	count > mySize ] whileFalse: [ 
		result := (result bitShift: 8) + (self at: count) ].
	^ result
]

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
ByteArray >> fromTwoBytes [

	^ (self at: 1) + ((self at: 2) bitShift: 8)
]
