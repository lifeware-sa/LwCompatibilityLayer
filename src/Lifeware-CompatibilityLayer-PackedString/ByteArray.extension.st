Extension { #name : #ByteArray }

{ #category : #'*Lifeware-CompatibilityLayer-PackedString' }
ByteArray >> asPackedString [

	" Encode the receiver into a printable String.
	We divide up the receiver into 6-bit chunks,
	and turn each one into a character whose code
	is in the range [32..95] (The terminating character
	of the string is in the range [32..98]).   Note
	that the result size is always a multiple of 4."

	"#[123 45 6 78] asPackedString '^24FS @a'
	#[123 45 6 78 90] asPackedString '^24FS%(b'
	#[123 45 6 78 90 123] asPackedString '^24FS%);'"

	| size result from to w stop |
	size := self size.
	result := self class new: size + 2 // 3 * 4.
	from := 1.
	to := 1.
	stop := self size. " Map groups of 3 source bytes into groups of 4 destination bytes."
	[ from <= stop ] whileTrue: [ 
		w := (self at: from) bitShift: 16.
		from < stop ifTrue: [ 
			w := w + ((self at: from + 1) bitShift: 8).
			from + 1 < stop ifTrue: [ w := w + (self at: from + 2) ] ].
		w := w bitXor: 16r820820. "flip the high bit of each group of 8"
		from := from + 3.
		result at: to put: (w bitShift: -18) + 32.
		result at: to + 1 put: ((w bitShift: -12) bitAnd: 63) + 32.
		result at: to + 2 put: ((w bitShift: -6) bitAnd: 63) + 32.
		result at: to + 3 put: (w bitAnd: 63) + 32.
		to := to + 4 ]. "If the size is not a multiple of 3 bytes, encode the remainder in the last character
	of the result, which is unused in this case. Use a code that is not in the range [32..95]."
	stop \\ 3 = 0 ifFalse: [ result at: to - 1 put: stop \\ 3 + 96 ].
	result primitiveChangeClassTo: ''.
	^ result
]

{ #category : #'*Lifeware-CompatibilityLayer-PackedString' }
ByteArray class >> fromPackedString: packedString [

	"Decode the receiver from a ByteArray that was a printable String.
	See ByteArray>>asPackedString for algorithm details. "

	"ByteArray halt; fromPackedString: '^24FS @a'"

	| size result last resultSize extra |
	size := packedString size.
	size = 0 ifTrue: [ ^ self new ].
	last := packedString last asInteger.
	resultSize := size // 4 * 3.
	last >= 96
		ifTrue: [ "not a multiple of 3"
			resultSize := resultSize - 3 + last - 96.
			extra := 1 ]
		ifFalse: [ extra := 0 ].
	result := self new: resultSize.

	self
		slowDecodeFrom: 1
		from: packedString
		startingAt: 1
		into: result.
		
	^ result
]

{ #category : #'*Lifeware-CompatibilityLayer-PackedString' }
ByteArray class >> slowDecodeFrom: start from: source startingAt: index into: dest [

	| from to w stop |
	to := start.
	from := index.
	stop := dest size.
	" Map groups of 4 source bytes into groups of 3 destination bytes. "
	[ to <= stop ] whileTrue: [ 
		w := (((source at: from) asInteger bitAnd: 63) bitShift: 18)
		     + (((source at: from + 1) asInteger bitAnd: 63) bitShift: 12)
		     + (((source at: from + 2) asInteger bitAnd: 63) bitShift: 6)
		     + ((source at: from + 3) asInteger bitAnd: 63).
		from := from + 4.
		dest at: to put: (w bitShift: -16).
		to < stop ifTrue: [ 
			dest at: to + 1 put: ((w bitShift: -8) bitAnd: 255).
			to + 1 < stop ifTrue: [ dest at: to + 2 put: (w bitAnd: 255) ] ].
		to := to + 3 ]
]
