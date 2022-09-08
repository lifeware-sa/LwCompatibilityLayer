Class {
	#name : #Sys,
	#superclass : #Object,
	#category : #'Lifeware-CompatibilityLayer-SystemInterface'
}

{ #category : #accessing }
Sys class >> platformClass [

	^ self forLinux: [ PH_Sys_linux ] forWindows: [ PH_Sys ]
]
