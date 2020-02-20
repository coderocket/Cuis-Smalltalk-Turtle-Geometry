'From Cuis 5.0 [latest update: #4024] on 20 February 2020 at 5:15:53 pm'!
'Description Turtle geometry operations on a two dimensional plane'!
!provides: 'Turtle-Geometry' 1 10!
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

!classDefinition: #Pen category: #'Turtle-Geometry'!
Turtle subclass: #Pen
	instanceVariableNames: 'canvas down width color'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Turtle-Geometry'!
!classDefinition: 'Pen class' category: #'Turtle-Geometry'!
Pen class
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

!Pen methodsFor: 'accessing' stamp: 'DF 2/19/2020 21:36:16'!
canvas: aCanvas
	canvas _ aCanvas! !

!Pen methodsFor: 'accessing' stamp: 'DF 2/19/2020 21:40:51'!
color: aColor
	color := aColor
	! !

!Pen methodsFor: 'accessing' stamp: 'DF 2/19/2020 21:41:02'!
width: aNumber
	width _ aNumber! !

!Pen methodsFor: 'pen operations' stamp: 'DF 2/20/2020 17:06:09'!
dot
	canvas ellipseCenterX: location x y: location y rx: width ry: width borderWidth: 0 borderColor: Color black fillColor: color! !

!Pen methodsFor: 'pen operations' stamp: 'DF 2/19/2020 21:37:50'!
down

	down _ true! !

!Pen methodsFor: 'pen operations' stamp: 'DF 2/19/2020 21:42:25'!
go: distance

	| old |
	
	old _ self location.
	
	super go: distance.
	
	down ifFalse:[^ self].
	
	canvas line: old to: self location width: width color: color ! !

!Pen methodsFor: 'pen operations' stamp: 'DF 2/19/2020 21:37:20'!
up

	down _ false! !

!Pen methodsFor: 'initialization' stamp: 'DF 2/19/2020 21:42:48'!
initialize

	super initialize.
	
	color _ Color black.
	
	width _ 1.
	
	self up.! !

!Pen class methodsFor: 'as yet unclassified' stamp: 'DF 2/19/2020 21:43:36'!
onCanvas: aCanvas

	^Pen new canvas: aCanvas.
	
	! !

!Pen class methodsFor: 'as yet unclassified' stamp: 'DF 2/19/2020 21:53:28'!
onDisplay

	^self onCanvas: Display getCanvas
	
	! !
