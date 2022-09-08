Class {
	#name : #ObjectMemoryInterface,
	#superclass : #Object,
	#category : #'Lifeware-CompatibilityLayer-SystemInterface'
}

{ #category : #'save and quit' }
ObjectMemoryInterface class >> basicQuit [

	Smalltalk quitPrimitive
]

{ #category : #garbage }
ObjectMemoryInterface class >> garbageCollect [

	^ Smalltalk garbageCollectMost
]

{ #category : #garbage }
ObjectMemoryInterface class >> garbageCollectIfPerm [

	^ Smalltalk garbageCollectMost
]

{ #category : #garbage }
ObjectMemoryInterface class >> globalGarbageCollect [

	^ Smalltalk garbageCollect
]

{ #category : #testing }
ObjectMemoryInterface class >> is64Bit [

	^ Smalltalk vm is64bit
]

{ #category : #'save and quit' }
ObjectMemoryInterface class >> permSaveAs: aFilename thenQuit: aBoolean [

	^ self saveAs: aFilename thenQuit: aBoolean
]

{ #category : #'save and quit' }
ObjectMemoryInterface class >> permSaveIfNeededAs: aFilename thenQuit: aBoolean [

	^ self saveAs: aFilename thenQuit: aBoolean
]

{ #category : #integration }
ObjectMemoryInterface class >> postIntegration [

	self globalGarbageCollect
]

{ #category : #'save and quit' }
ObjectMemoryInterface class >> preQuit [

	ChangesLog default logSnapshot: false andQuit: true.
	SessionManager default currentSession stop: true
]

{ #category : #garbage }
ObjectMemoryInterface class >> quickGC [

	^ Smalltalk garbageCollectMost
]

{ #category : #'save and quit' }
ObjectMemoryInterface class >> quit [

	| wait |
	wait := Semaphore new.

	[ 
	ChangesLog default logSnapshot: false andQuit: true.
	SessionManager default currentSession stop: true.
	Smalltalk quitPrimitive.
	wait signal ] forkAt: Processor timingPriority - 1.
	^ wait wait
]

{ #category : #'save and quit' }
ObjectMemoryInterface class >> saveAs: aFilename thenQuit: aBoolean [

	| image |
	image := SmalltalkImage current.
	(SourceFiles changesFileStream isNil or: [ 
		 SourceFiles changesFileStream closed ]) ifFalse: [ 
		image closeSourceFiles.
		image saveChangesInFileNamed:
			(image fullNameForChangesNamed: aFilename) ].
	^ (image
		   changeImagePathTo: (image fullNameForImageNamed: aFilename);
		   closeSourceFiles;
		   openSourceFiles;
		   snapshot: true andQuit: aBoolean) not
]
