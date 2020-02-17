'From Cuis 5.0 [latest update: #4024] on 17 February 2020 at 3:18:34 pm'!
'Description Turtle geometry operations on a two dimensional plane'!
!provides: 'Turtle-Geometry' 1 2!
SystemOrganization addCategory: #'Turtle-Geometry'!


!classDefinition: #TestTurtle category: #'Turtle-Geometry'!
TestCase subclass: #TestTurtle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Turtle-Geometry'!
!classDefinition: 'TestTurtle class' category: #'Turtle-Geometry'!
TestTurtle class
	instanceVariableNames: ''!

!classDefinition: #Turtle category: #'Turtle-Geometry'!
Object subclass: #Turtle
	instanceVariableNames: 'heading location'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Turtle-Geometry'!
!classDefinition: 'Turtle class' category: #'Turtle-Geometry'!
Turtle class
	instanceVariableNames: ''!


!Turtle commentStamp: '<historical>' prior: 0!
I am a turtle that moves on a two dimensional plane. I have a location point and a movement vector. !

!TestTurtle methodsFor: 'as yet unclassified' stamp: 'DF 2/17/2020 15:18:19'!
test
	| aTurtle origin |
	
	aTurtle _ Turtle new.

	origin _ aTurtle location.
		
	aTurtle go: 1; turn:90; go:1; turn:90; go:1; turn:90; go:1; turn:90.
	
	self assert: (origin - aTurtle location) r < 1e-12.! !

!Turtle methodsFor: 'moving' stamp: 'DF 2/17/2020 14:50:17'!
go: distance
	
	self goto: heading * distance + location! !

!Turtle methodsFor: 'moving' stamp: 'DF 2/17/2020 14:50:49'!
goto: aPoint

	location _ aPoint! !

!Turtle methodsFor: 'moving' stamp: 'DF 2/17/2020 14:56:02'!
home

	heading := 0@1.
	location := 0@0.! !

!Turtle methodsFor: 'moving' stamp: 'DF 2/17/2020 14:57:52'!
scale: aNumber
	
	heading := Point rho: aNumber theta: heading theta! !

!Turtle methodsFor: 'moving' stamp: 'DF 2/17/2020 15:02:37'!
turn: degrees

	heading _ heading rotatedBy: degrees degreesToRadians ! !

!Turtle methodsFor: 'initialization' stamp: 'DF 2/17/2020 14:54:34'!
initialize

	self home! !

!Turtle methodsFor: 'accessing' stamp: 'DF 2/17/2020 14:59:01'!
direction
	^heading theta radiansToDegrees ! !

!Turtle methodsFor: 'accessing' stamp: 'DF 2/17/2020 14:56:15'!
location
	^ location! !
