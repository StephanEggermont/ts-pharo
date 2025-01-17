"
I am a {{gtClass:BlElement}} that displays information about a single {{gtClass:GsTrackModel}}.
I draw one row of the timeline in a {{gtClass:GsTimeline}}
"
Class {
	#name : #GsAnimationTrack,
	#superclass : #GsObject,
	#instVars : [
		'keyFrames',
		'trackH'
	],
	#category : #'GameSketchLib-UI'
}

{ #category : #accessing }
GsAnimationTrack >> addFrames: aCollection [
  "should be list of key -> value associations"
  keyFrames addAll: aCollection.
  self redrawFrames
]

{ #category : #accessing }
GsAnimationTrack >> initialize [
  super initialize.
  self hMatchParent vExact: (trackH := 20).
  keyFrames := SortedCollection sortUsing: [:a :b |  a key < b key ].
]

{ #category : #accessing }
GsAnimationTrack >> redrawFrames [
  |cw| cw := [self parent colW] onErrorDo: [20].
  self removeChildren addChildren: (keyFrames collect: [:kv|
    GsObject new
      vMatchParent hExact: cw ;
      background: Color white;
      border: Color veryVeryDarkGray;
      relocate:  cw * kv key @ 0])
]
