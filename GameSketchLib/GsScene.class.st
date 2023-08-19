"
I am a top-level {{gtClass:GsSketch}}, with a background.

My instances can be chained together to make complex games or presentations.

"
Class {
	#name : #GsScene,
	#superclass : #GsSketch,
	#category : #'GameSketchLib-Core'
}

{ #category : #accessing }
GsScene >> initialize [
  super initialize.
  self matchParent background: GsColor defaultBg
]