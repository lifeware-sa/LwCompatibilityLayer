Extension { #name : #Object }

{ #category : #'*Lifeware-CompatibilityLayer-PlatformSpecific' }
Object >> forLinux: aLinuxBlock forWindows: aWinBlock [

	^ Smalltalk platform isWindows
		  ifTrue: [ aWinBlock value ]
		  ifFalse: [ aLinuxBlock value ]
]
