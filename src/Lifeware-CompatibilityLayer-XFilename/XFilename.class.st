Class {
	#name : #XFilename,
	#superclass : #Object,
	#instVars : [
		'string'
	],
	#category : #'Lifeware-CompatibilityLayer-XFilename'
}

{ #category : #utilities }
XFilename class >> canonicalize: aString [

	| string isCifsNetworkName |
	string := aString copyReplaceAll: '\' with: '/'.
	isCifsNetworkName := string size >= 2 and: [ 
		                     string first = $/ and: [ (string at: 2) = $/ ] ].
	string := self removeMultipleSeparator: string.
	^ isCifsNetworkName
		  ifTrue: [ '/' , string ]
		  ifFalse: [ string ]
]

{ #category : #utilities }
XFilename class >> canonicalizeFolderName: aString [
	| string |
	string := self canonicalize: aString.
	string isEmpty ifTrue: [^string].
	string last = $/ ifFalse: [^string].
	^string copyFrom: 1 to: string size - 1
]

{ #category : #utilities }
XFilename class >> canonicalizeRelativeFolderName: aString [

	| string |
	string := self canonicalizeFolderName: aString.
	(string notEmpty and: [ string first = $/ ]) ifTrue: [ 
		string := string copyFrom: 2 to: string size ].
	(string notEmpty and: [ string first = $/ ]) ifTrue: [ 
		self error: aString , ' should not be a networkname' ].
	^ string
]

{ #category : #'instance creation' }
XFilename class >> fromComponents: aCollection [

	| stream |
	stream := (String new: 80) writeStream.
	aCollection
		do: [ :each | stream nextPutAll: each ]
		separatedBy: [ stream nextPut: $/ ].
	^ self new setString: stream contents
]

{ #category : #accessing }
XFilename class >> installBaseFolder [

	^ self named: FileSystem disk workingDirectory fullName
]

{ #category : #'instance creation' }
XFilename class >> named: aString [

	^ self new setString: aString
]

{ #category : #utilities }
XFilename class >> removeMultipleSeparator: aString [

	| new |
	new := (String new: aString size) writeStream.
	aString inject: false into: [ :wasSeparator :char | 
		char = $/
			ifTrue: [ wasSeparator ifFalse: [ new nextPut: $/ ] ]
			ifFalse: [ new nextPut: char ].
		char = $/ ].
	^ new contents
]

{ #category : #accessing }
XFilename class >> separator [
	^FileSystem disk delimiter
]

{ #category : #concatenating }
XFilename >> / aStringOrFilename [ 
	^self \ aStringOrFilename
]

{ #category : #concatenating }
XFilename >> \ aStringOrFilename [
	| name |
	name := aStringOrFilename asString.
	name isEmpty ifTrue: [^self].
	^self class named: (self class canonicalizeFolderName: string) , '/'
				, (self class canonicalizeRelativeFolderName: name)
]

{ #category : #converting }
XFilename >> asString [

	| separator |
	separator := self class separator.
	^ string collect: [ :e | 
		  e = $/
			  ifTrue: [ separator ]
			  ifFalse: [ e ] ]
]

{ #category : #accessing }
XFilename >> binaryContents [

	| stream |
	stream := string asFileReference binaryReadStream.
	^ [ stream contents ] ensure: [ stream close ]
]

{ #category : #accessing }
XFilename >> components [

	| components |
	components := string findTokens: $/.
	components isEmpty ifTrue: [ ^ components asArray ].
	components last isEmpty ifTrue: [ components removeLast ].
	^ components asArray
]

{ #category : #actions }
XFilename >> createParentOf: file [
	file parent exists
		ifFalse: 
			[file parent parent exists ifFalse: [self createParentOf: file parent].
			file parent createDirectory]
]

{ #category : #testing }
XFilename >> exists [

	^ string asFileReference exists
]

{ #category : #accessing }
XFilename >> headFilename [
	| components |
	self isEmpty ifTrue: [^self copy].
	components := self components asOrderedCollection.
	components at:  components size put: ''.
	^self class fromComponents: components
]

{ #category : #testing }
XFilename >> isEmpty [

	^ self components isEmpty
]

{ #category : #actions }
XFilename >> makeDeepDirectory [

	| headFilename |
	self isEmpty ifTrue: [ ^ self ].
	self exists ifTrue: [ ^ self ].
	headFilename := self headFilename.
	headFilename makeDeepDirectory.
	(headFilename isEmpty
		 ifTrue: [ self tail asXFilename ]
		 ifFalse: [ headFilename \ self tail ]) makeDirectory
]

{ #category : #actions }
XFilename >> makeDirectory [

	| file |
	self exists ifTrue: [ ^ self ].
	file := string asFileReference.
	file parent exists ifFalse: [ file parent createDirectory ].
	file createDirectory
]

{ #category : #actions }
XFilename >> putBinaryContents: aByteArray [
	| stream file |
	file := string asFileReference.
	self createParentOf: file.
	file exists ifFalse: [file createFile].
	stream := file binaryWriteStream truncate.
	^[stream nextPutAll: aByteArray asByteArray] ensure: [stream close]
]

{ #category : #initialization }
XFilename >> setString: aString [

	string := self class canonicalize: aString
]

{ #category : #accessing }
XFilename >> tail [

	self isEmpty ifTrue: [ ^ '' ].
	^ self components last
]
