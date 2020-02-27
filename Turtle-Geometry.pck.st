'From Cuis 5.0 [latest update: #4024] on 26 February 2020 at 12:25:38 am'!
'Description Turtle geometry operations on a two dimensional plane'!
!provides: 'Turtle-Geometry' 1 13!
SystemOrganization addCategory: #'Turtle-Geometry'!


!classDefinition: #TestConvexPolygon category: #'Turtle-Geometry'!
TestCase subclass: #TestConvexPolygon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Turtle-Geometry'!
!classDefinition: 'TestConvexPolygon class' category: #'Turtle-Geometry'!
TestConvexPolygon class
	instanceVariableNames: ''!

!classDefinition: #TestLineSegmentIntersection category: #'Turtle-Geometry'!
TestCase subclass: #TestLineSegmentIntersection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Turtle-Geometry'!
!classDefinition: 'TestLineSegmentIntersection class' category: #'Turtle-Geometry'!
TestLineSegmentIntersection class
	instanceVariableNames: ''!

!classDefinition: #TestMatrix2D category: #'Turtle-Geometry'!
TestCase subclass: #TestMatrix2D
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Turtle-Geometry'!
!classDefinition: 'TestMatrix2D class' category: #'Turtle-Geometry'!
TestMatrix2D class
	instanceVariableNames: ''!

!classDefinition: #TestTurtle category: #'Turtle-Geometry'!
TestCase subclass: #TestTurtle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Turtle-Geometry'!
!classDefinition: 'TestTurtle class' category: #'Turtle-Geometry'!
TestTurtle class
	instanceVariableNames: ''!

!classDefinition: #ConvexPolygon category: #'Turtle-Geometry'!
Object subclass: #ConvexPolygon
	instanceVariableNames: 'vertices'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Turtle-Geometry'!
!classDefinition: 'ConvexPolygon class' category: #'Turtle-Geometry'!
ConvexPolygon class
	instanceVariableNames: ''!

!classDefinition: #Matrix2D category: #'Turtle-Geometry'!
Object subclass: #Matrix2D
	instanceVariableNames: 'a b c d'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Turtle-Geometry'!
!classDefinition: 'Matrix2D class' category: #'Turtle-Geometry'!
Matrix2D class
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

!classDefinition: #TurtleTrip category: #'Turtle-Geometry'!
Object subclass: #TurtleTrip
	instanceVariableNames: 'headings origin heading directions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Turtle-Geometry'!
!classDefinition: 'TurtleTrip class' category: #'Turtle-Geometry'!
TurtleTrip class
	instanceVariableNames: ''!


!Turtle commentStamp: '<historical>' prior: 0!
I am a turtle that moves on a two dimensional plane. I have a location point and a movement vector. !

!TestConvexPolygon methodsFor: 'tests' stamp: 'DF 2/24/2020 14:50:57'!
testArea

	| r |
	
	r _ ConvexPolygon new.
	
	r addVertex: 1@1 ; addVertex: 3@1; addVertex: 3@4; addVertex: 1@4; close.
	
	
	self assert: 6 equals: r area! !

!TestConvexPolygon methodsFor: 'tests' stamp: 'DF 2/24/2020 13:46:41'!
testContains

	| r |
	
	r _ ConvexPolygon new.
	
	r addVertex: 1@1 ; addVertex: 3@1; addVertex: 3@4; addVertex: 1@4; close.
	
	self assert: (r contains: 2@2).
	
	self assert: (r contains: 4@2) not.! !

!TestConvexPolygon methodsFor: 'tests' stamp: 'DavidFaitelson 1/22/2020 15:02'!
testIntersecting

	| aTriangle aSquare |
	
	aTriangle := ConvexPolygon new.
	
	aTriangle addVertex: 1@1 ; addVertex: 2@2; addVertex: 1@2; close.
	
	aSquare := ConvexPolygon new.
	
	aSquare addVertex: 1.5@1.5 ; addVertex: 3@1; addVertex: 3@0; addVertex: 2@0; close.
	
	self assert: (aTriangle intersects: aSquare).

	self assert: (aSquare intersects: aTriangle).
	! !

!TestConvexPolygon methodsFor: 'tests' stamp: 'DF 2/24/2020 13:23:47'!
testIntersectionWithLineSegment

	| aTriangle pts |
	
	aTriangle _ ConvexPolygon new.
	
	aTriangle addVertex: 1@1 ; addVertex: 2@2; addVertex: 1@2; close.

	pts _ aTriangle intersect: 3@0 to: 0@3.
	
	self assert: 2 equals: pts size.
	
	self assert: (pts includes: (3/2)@(3/2)).
	
	self assert: (pts includes: 1@2).! !

!TestConvexPolygon methodsFor: 'tests' stamp: 'DF 2/24/2020 13:59:56'!
testIntersectionWithPolygon

	| r1 r2 p r |
	
	r1 _ ConvexPolygon new.
	
	r1 addVertex: 1@1 ; addVertex: 3@1; addVertex: 3@4; addVertex: 1@4; close.

	r2 _ ConvexPolygon new.
	
	r2 addVertex: 2@2 ; addVertex: 5@2; addVertex: 5@3; addVertex: 2@3; close.

	p _ r1 intersect: r2.

	r _ ConvexPolygon from: (OrderedCollection with: 2@2 with: 3@2 with: 3@3 with: 2@3).
	
	self assert: r equals: p.! !

!TestConvexPolygon methodsFor: 'tests' stamp: 'DavidFaitelson 2/6/2020 13:25'!
testMerge

	| a b c e |
	
	a := ConvexPolygon new.
	
	a addVertex: 1@1 ; addVertex: 2@2; addVertex: 1@2; close.
	
	b := ConvexPolygon new.
	
	b addVertex: 2@3 ; addVertex: 3@3; addVertex: 3@2; close.

	c := a convexMerge: b.
	
	e := ConvexPolygon new.
	
	e addVertex: 1@1; addVertex: 3@2; addVertex: 3@3; addVertex: 2@3; addVertex: 1@2; close.
	
	self assert: e vertices = c vertices
	
! !

!TestConvexPolygon methodsFor: 'tests' stamp: 'DF 2/23/2020 21:23:46'!
testMergeRectangle

	| a b c |
	
	a := ConvexPolygon new.
	
	a addVertex: 1@1 ; addVertex: 3@1; addVertex: 3@3; addVertex: 1@3; close.
	
	b := ConvexPolygon new.
	
	b addVertex: 2@2 ; addVertex: 4@2; addVertex: 4@4; addVertex: 2@4; close.

	c := a convexMerge: b.
	
	self assert: { 1@1 . 3@1 . 4@2. 4@4. 2@4. 1@3 . 1@1 } asOrderedCollection equals: c vertices 
	
! !

!TestConvexPolygon methodsFor: 'tests' stamp: 'DavidFaitelson 1/22/2020 14:58'!
testNotIntersecting

	| aTriangle aSquare |
	
	aTriangle := ConvexPolygon new.
	
	aTriangle addVertex: 1@1 ; addVertex: 2@2; addVertex: 1@2; close.
	
	aSquare := ConvexPolygon new.
	
	aSquare addVertex: 2@1 ; addVertex: 3@1; addVertex: 3@0; addVertex: 2@0; close.
	
	self assert: (aTriangle intersects: aSquare) not.

	self assert: (aSquare intersects: aTriangle) not.
	! !

!TestConvexPolygon methodsFor: 'tests' stamp: 'DF 2/23/2020 18:27:23'!
testProjection

	| aTriangle xs |
	
	aTriangle := ConvexPolygon new.
	
	aTriangle addVertex: 1@1 ; addVertex: 2@2; addVertex: 1@2; close.
	
	xs := aTriangle projectOn: ((2@2) - (1@1)) normal.
	
	self assert: (xs at:1) isCloseTo: 0.
	self assert: (xs at:2) isCloseTo: 0.
	self assert: (xs at:3) isCloseTo: 2.0 sqrt / 2.
	! !

!TestLineSegmentIntersection methodsFor: 'as yet unclassified' stamp: 'DF 2/24/2020 13:11:57'!
test

	| p q u v ts |
	
	p _ 2@1.
	q _ 2@3.
	
	u _ 1@2.
	v _ 4@2.
	
	ts _ p to:q intersection: u to: v.

	self assert: ts size equals:1.
		
	self assert: 2@2 equals: (ts first).
! !

!TestLineSegmentIntersection methodsFor: 'as yet unclassified' stamp: 'DF 2/24/2020 13:12:37'!
testParallel

	| p q u v ts |
	
	p _ 0@0.
	q _ 1@0.
	
	u _ 0@2.
	v _ 1@2.
	
	ts _ p to:q intersection: u to: v.

	self assert: ts size equals:0.
! !

!TestMatrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:27:47'!
testIdentity

	self assert: Matrix2D identity * (2@3) equals: 2@3! !

!TestMatrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 17:31:10'!
testInverse

	| aMatrix |
	
	aMatrix _ Matrix2D new a: 6 ; b: 4 ; c: 2 ; d: 2.
	
	self assert: aMatrix inverse equals: (Matrix2D new a: 1/2 ; b: -1; c: -1/2; d: 3/2).! !

!TestTurtle methodsFor: 'as yet unclassified' stamp: 'DF 2/17/2020 15:18:19'!
test
	| aTurtle origin |
	
	aTurtle _ Turtle new.

	origin _ aTurtle location.
		
	aTurtle go: 1; turn:90; go:1; turn:90; go:1; turn:90; go:1; turn:90.
	
	self assert: (origin - aTurtle location) r < 1e-12.! !

!ConvexPolygon methodsFor: 'accessing' stamp: 'DF 2/24/2020 14:52:16'!
area

	| c rs |
	c _ self centroid.
	
	rs _ vertices overlappingPairsCollect:[:p :q | p - c crossProduct: q - c ].
	
	^ rs sum / 2! !

!ConvexPolygon methodsFor: 'accessing' stamp: 'DF 2/24/2020 14:23:06'!
centroid

	^vertices mean
	! !

!ConvexPolygon methodsFor: 'accessing' stamp: 'DavidFaitelson 1/22/2020 14:21'!
edges 

	^vertices overlappingPairsCollect: [ :first :second | first - second ]! !

!ConvexPolygon methodsFor: 'accessing' stamp: 'DavidFaitelson 2/6/2020 13:23'!
vertices
	^ vertices! !

!ConvexPolygon methodsFor: 'polygon operations' stamp: 'DavidFaitelson 2/6/2020 13:19'!
convexMerge: aConvexPolygon

	| p vs |
	
	p := self class new.
	
	vs := Set new.
	
	vs addAll: vertices.
	vs addAll: aConvexPolygon vertices.
	
	vs asOrderedCollection convexHull do:[:each | p addVertex: each].

	p close.
	
	^p! !

!ConvexPolygon methodsFor: 'polygon operations' stamp: 'DF 2/24/2020 13:58:45'!
intersect: aConvexPolygon

	| pts |
	
	pts _ vertices overlappingPairsCollect: [ :start :end | aConvexPolygon intersect: start to: end ].
	
	pts _ pts inject: Set new into: [:acc :each | acc addAll: each. acc ].
	
	pts addAll: (vertices select:[:each | aConvexPolygon contains: each ]).
	
	pts addAll: ( aConvexPolygon vertices select:[:each | self contains: each]).
	
	^ConvexPolygon from: pts convexHull
	! !

!ConvexPolygon methodsFor: 'polygon operations' stamp: 'DavidFaitelson 1/22/2020 14:22'!
projectOn: aPoint

	^vertices collect:[:each | each projectOn: aPoint ]
	! !

!ConvexPolygon methodsFor: 'private' stamp: 'DF 2/24/2020 13:24:46'!
intersect: start2 to: end2

	| pts |
	
	pts _ vertices overlappingPairsCollect:[:start1 :end1 | start1 to: end1 intersection: start2 to: end2 ].
	
	^ pts inject: Set new into: [:acc :each | acc addAll: each. acc ].! !

!ConvexPolygon methodsFor: 'private' stamp: 'DavidFaitelson 1/22/2020 14:57'!
mayIntersect: aConvexPolygon

	^self edges allSatisfy: [ :each | | ps qs n |
		n := each normal.
		ps := self projectOn: n.
		qs := aConvexPolygon projectOn: n.
		(ps max >= qs min) and: [ps min <= qs max]  ] ! !

!ConvexPolygon methodsFor: 'initialization' stamp: 'DavidFaitelson 1/22/2020 14:02'!
initialize
	vertices := OrderedCollection new! !

!ConvexPolygon methodsFor: 'comparing' stamp: 'DF 2/24/2020 14:01:17'!
= aConvexPolygon

	self == aConvexPolygon ifTrue:[^true].
	
	self species == aConvexPolygon species ifFalse:[^false].
	
	^ self vertices = aConvexPolygon vertices! !

!ConvexPolygon methodsFor: 'adding' stamp: 'DavidFaitelson 1/22/2020 14:03'!
addVertex: aPoint
	vertices add: aPoint
	! !

!ConvexPolygon methodsFor: 'adding' stamp: 'DavidFaitelson 1/22/2020 14:20'!
close
	vertices add: vertices first! !

!ConvexPolygon methodsFor: 'testing' stamp: 'DF 2/24/2020 13:46:03'!
contains: aPoint

	| bs |
	
	bs _ vertices overlappingPairsCollect: [ :start :end | start to: end sideOf: aPoint ].
	
	^ bs allSatisfy:[:each | each = #left ].! !

!ConvexPolygon methodsFor: 'testing' stamp: 'DavidFaitelson 1/22/2020 14:58'!
intersects: aConvexPolygon

	^(self mayIntersect: aConvexPolygon) and:[aConvexPolygon mayIntersect: self]! !

!ConvexPolygon methodsFor: 'moment of intertia' stamp: 'DF 2/26/2020 00:09:16'!
momentOfIntertia: density

	| ms |
	
	ms _ vertices overlappingPairsCollect:[:p :q | self triangleMoment: p to: q].
	
	^ density * ms sum / 2! !

!ConvexPolygon methodsFor: 'moment of intertia' stamp: 'DF 2/26/2020 00:21:01'!
triangleMoment: p to: q

	| c h1 h2 t1 t2 tan1 tan2 w |
	
	c _ self centroid.
	
	h1 _ (p - c) dotProduct: (q - c) normalized.

	w _ ((p -c) r squared - h1 squared) sqrt.
	
	h2 _ (p - q) dotProduct: (c - q) normalized.	

	t1 _ h1 = 0 
		ifTrue:[ 0 ]
		ifFalse:[
			tan1 _ w / h1.
			(1/2) * (h1 raisedTo:4) * tan1 * ( 1 + ((tan1 raisedTo:2) / 3))].

	t2 _ h2 = 0
		ifTrue: [ 0 ]
		ifFalse:[
			tan2 _ w / h2.
			(1/6) * (h2 raisedTo:2) * tan2 * (3 * (h2 raisedTo:2) + ((tan2 raisedTo:2) * (h2 raisedTo:2)) - (8*h2*(h1+h2)) + (6 * ((h1 + h2) raisedTo:2)))].
	
	^t1 + t2
	
! !

!ConvexPolygon class methodsFor: 'as yet unclassified' stamp: 'DF 2/24/2020 13:58:24'!
from: anOrderedCollection

	| aConvexPolygon |
	
	aConvexPolygon _ self new.
	
	anOrderedCollection do:[:each | aConvexPolygon addVertex: each ].
	
	aConvexPolygon close.
	
	^ aConvexPolygon! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:27:27'!
* aPoint

	^ ((a * (aPoint x)) + (b * (aPoint y))) @ ((c * (aPoint x)) + (d * (aPoint y)))! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:20:51'!
/ aNumber 

	^Matrix2D new a: a / aNumber ; b: b / aNumber ; c: c / aNumber ; d: d / aNumber! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 17:26:28'!
= aMatrix2D

	self == aMatrix2D ifTrue:[^true].
	
	self species == aMatrix2D species ifFalse:[^false].
	
	^a = aMatrix2D a and:[b = aMatrix2D b] and:[c = aMatrix2D c] and:[d = aMatrix2D d].! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:15:05'!
a
	^a
	! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:14:49'!
a: aNumber
	a _ aNumber! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 17:40:26'!
ac: aPoint

	a _ aPoint x.
	c _ aPoint y.! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:18:36'!
adj

	^Matrix2D new a: d ; b: b negated ; c: c negated ; d: a! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:15:08'!
b
	^b
	! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:14:52'!
b: aNumber
	b _ aNumber! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:19:28'!
bd: aPoint
	b _ aPoint x.
	d _ aPoint y! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:15:11'!
c
	^c
	! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:14:55'!
c: aNumber
	c _ aNumber! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:15:14'!
d
	^d
	! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:14:58'!
d: aNumber
	d _ aNumber! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:15:40'!
determinant

	^ (a * d) - (b * c)! !

!Matrix2D methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:20:11'!
inverse

	^ self adj / self determinant! !

!Matrix2D class methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 16:24:40'!
identity

	^Matrix2D new a:1 ; b:0 ; c:0; d:1! !

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

!Turtle methodsFor: 'moving' stamp: 'DF 2/20/2020 18:30:39'!
north

	heading _ 0! !

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

!Pen methodsFor: 'pen operations' stamp: 'DF 2/24/2020 14:22:29'!
dot
	canvas ellipseCenterX: location x + (width / 2) y: location y + (width / 2) rx: width ry: width borderWidth: 0 borderColor: Color black fillColor: color! !

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

!TurtleTrip methodsFor: 'as yet unclassified' stamp: 'DF 2/23/2020 22:15:42'!
bbox: aTurtle

	| pts |
	
	pts _ self waypoints: aTurtle.

	^ pts min corner: pts max
	

	! !

!TurtleTrip methodsFor: 'as yet unclassified' stamp: 'DF 2/20/2020 18:30:12'!
initialize

	directions _ OrderedCollection new! !

!TurtleTrip methodsFor: 'as yet unclassified' stamp: 'DF 2/20/2020 18:30:16'!
turn: degrees go: distance

	directions add: (Point r: distance degrees: degrees)! !

!TurtleTrip methodsFor: 'as yet unclassified' stamp: 'DF 2/22/2020 19:24:20'!
waypoints: aTurtle
	
	^directions collect: [:each | aTurtle turn: each theta radiansToDegrees ; go: each r ; location ]! !

!Collection methodsFor: '*Turtle-Geometry' stamp: 'DF 2/23/2020 21:40:45'!
convexHull

	| start points hull k head a b |
	
	start := self inject: self anyOne into: [ :min :each | (min before: each) ifTrue:[min] ifFalse:[each] ].
	
	points := self sorted: [ :p :q |  
		a := (p - start) angle. 
		b := (q - start) angle.
		a < b or:[ a = b and: [ p x <= q x ] ] ].
	
	hull := OrderedCollection new.
	
	hull add: (points at:1).
	
	head := points at:2.
	
	k := 3.
	
	[k <= points size]
		whileTrue:[ 
			(head - hull last sideOf: (points at:k) - hull last) = #right 
				ifFalse:[ hull add: head. head := (points at:k). k := k + 1 ]
				ifTrue:[ head := hull last. hull removeLast. ]. 
			].
		
	hull add:head.
	
	^hull! !

!SequenceableCollection methodsFor: '*Turtle-Geometry'!
overlappingPairsCollect: aBlock 
	"Answer the result of evaluating aBlock with all of the overlapping pairs of my elements."
	| retval |
	retval := self species ofSize: self size - 1.
	1 to: self size - 1
		do: [:i | retval at: i put: (aBlock value: (self at: i) value: (self at: i + 1)) ].
	^retval! !

!Point methodsFor: '*Turtle-Geometry'!
angle
	"Answer the angle in radians between the vectors represented by the receiver and (1, 0) from the origin."

	^ self y arcTan: self x! !

!Point methodsFor: '*Turtle-Geometry' stamp: 'DF 2/23/2020 21:38:04'!
before: aPoint

	^self y < aPoint y or:[ self y = aPoint y and:[ self x < aPoint x ] ]! !

!Point methodsFor: '*Turtle-Geometry' stamp: 'DF 2/20/2020 11:45:20'!
projectOn: aPoint

	^self dotProduct: aPoint normalized! !

!Point methodsFor: '*Turtle-Geometry' stamp: 'DF 2/24/2020 13:11:22'!
to: end1 intersection: start2 to: end2 

	| aMatrix t u v w ips |
	
	ips _ OrderedCollection new.
	
	u _ self - end1.
	
	v _ end2 - start2.

	w _ self - start2.
		
	aMatrix _ Matrix2D new ac: u ; bd: v.
	
	aMatrix determinant = 0 ifTrue:[^ ips].
		
	t _ aMatrix inverse * w.
	
	(t >= (0@0) and: [ t <= (1@1) ])
		ifTrue: [ips add: self - (t x * u)].
	
	^ ips! !
