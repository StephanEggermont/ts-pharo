"
I act like an accessor for a property on objects in the scene.

I am probably a bad idea, but basically I make {{gtClass:BlElement}} look like it has nice symmetrical getter/setter pairs.

For example, instead of `position`/`position:`, it has `position`/`relocate:`, and also there is also no simple `rotation` accessor.

Probably I will be replaced by simple symmetric setters in {{gtClass:GsObject}}that delegate to the corresponding {{gtClass:BlElement}} properties.


"
Class {
	#name : #GsProp,
	#superclass : #Object,
	#instVars : [
		'target'
	],
	#category : #'GameSketchLib-Props'
}

{ #category : #accessing }
GsProp class >> for: anObject [
  ^ self new target: anObject
]

{ #category : #accessing }
GsProp class >> for: aSlotName on: anObject [
  ^ (GsProp perform: aSlotName) target: anObject
]

{ #category : #creating }
GsProp class >> position [
  ^ GsPositionProp new
]

{ #category : #creating }
GsProp class >> rotation [
  ^ GsRotationProp new
]

{ #category : #accessing }
GsProp >> get [
  ^ self read: target 
]

{ #category : #accessing }
GsProp >> printOn: aStream [
  super printOn: aStream.
  aStream nextPutAll: '(for: '.
  target id printOn: aStream.
  aStream nextPut: $).
]

{ #category : #accessing }
GsProp >> read: anObject [
  self subclassResponsibility
]

{ #category : #accessing }
GsProp >> set: aValue [
  ^ self write: aValue to: target 
]

{ #category : #accessing }
GsProp >> target [
	^ target
]

{ #category : #accessing }
GsProp >> target: anObject [
	target := anObject
]

{ #category : #accessing }
GsProp >> write: aValue to: anObject [
  self subclassResponsibility
]
