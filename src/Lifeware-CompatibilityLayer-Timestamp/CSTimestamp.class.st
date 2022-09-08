Class {
	#name : #CSTimestamp,
	#superclass : #Object,
	#category : #'Lifeware-CompatibilityLayer-Timestamp'
}

{ #category : #accessing }
CSTimestamp class >> systemNow [

	^ DateAndTime now
]
