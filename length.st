"Author: Vilnis Jatnieks"
"Length.st"

Object subclass: #LengthNexter
instanceVariableNames: ''
classVariableNames: ''
poolDictionaries: ''
category: 'nil'
!

LengthNexter comment: 'I provide a next function for folds.'.

Object subclass: #Node
instanceVariableNames: 'data next'
classVariableNames: ''
poolDictionaries: ''
category: 'nil'
!

Node comment: 'I hold data and a reference to the next Node.'.

!Node methodsFor: 'initializing'!
initialize: d
  data := d.
  next := nil.
  ^self
!!

!Node methodsFor: 'adding'!
push: newNode
  next isNil
    ifTrue: [next := newNode]
    ifFalse: [next push: newNode].
  ^self
!!

!Node methodsFor: 'length calculation'!
lengthRecursive
  next isNil
    ifTrue: [^1].
  ^(1 + next lengthRecursive)
!

lengthHelper: rsf
  next isNil
    ifTrue: [^rsf + 1].
  ^next lengthHelper: rsf + 1
!

lengthTailRecursive
  ^self lengthHelper: 0
!

lengthFold
  Transcript show: '1 point skip'; cr.
!!

Object subclass: #List
instanceVariableNames: 'root'
classVariableNames: ''
poolDictionaries: ''
category: 'nil'
!

List comment: 'I hold the root node.'.

!List methodsFor: 'initializing'!
initialize: node
  root := node.
  ^self
!!

!List methodsFor: 'adding'!
push: newNode
  root isNil
    ifTrue: [root := newNode]
    ifFalse: [root push: newNode].
  ^self
!!

!List methodsFor: 'length calculation'!
lengthRecursive
  root isNil
    ifTrue: [^0].
  ^root lengthRecursive
!

lengthTailRecursive
  root isNil
    ifTrue: [^0].
  ^root lengthTailRecursive
!

lengthFold
  root isNil
    ifTrue: [^0].
  ^root lengthFold
!!

| test1 test2 test3 |
test1 := List new initialize: nil.
test2 := List new initialize: (Node new initialize: 0).
test3 := List new initialize: (Node new initialize: 0).

test3 push: (Node new initialize: 1).

Transcript show: 'Test 1 - empty list'; cr.
Transcript show: 'Length (Recursive): ', (test1 lengthRecursive printString); cr.
Transcript show: 'Length (Tail Recursive): ', (test1 lengthTailRecursive printString); cr.
Transcript show: 'Length (Fold): ', (test1 lengthFold printString); cr.

Transcript show: 'Test 2 - one element list'; cr.
Transcript show: 'Length (Recursive): ', (test2 lengthRecursive printString); cr.
Transcript show: 'Length (Tail Recursive): ', (test2 lengthTailRecursive printString); cr.
test2 lengthFold.

Transcript show: 'Test 3 - two element list'; cr.
Transcript show: 'Length (Recursive): ', (test3 lengthRecursive printString); cr.
Transcript show: 'Length (Tail Recursive): ', (test3 lengthTailRecursive printString); cr.
test3 lengthFold.
