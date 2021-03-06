﻿"Filed out from Dolphin Smalltalk 7"!

Presenter subclass: #SelectableItemsPresenter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SelectableItemsPresenter guid: (GUID fromString: '{266d2ff0-37e3-4f48-92df-759d16a0fe97}')!
SelectableItemsPresenter isAbstract: true!
SelectableItemsPresenter comment: 'SelectableItemsPresenter ia an abstract class that implements the <selectableItems> protocol for components that need to make one or more selections from multiple items held by their model. Typically the model will be either a <listModel> or <treeModel>.'!
!SelectableItemsPresenter categoriesForClass!MVP-Presenters!MVP-Resources-Lists! !
!SelectableItemsPresenter methodsFor!

ensureSelectionVisible
	"Ensure the selected item is visible, scrolling it into view if necessary.
	Raise an error if there is no selection."

	self selectableItems ensureSelectionVisible!

hasSelection
	"Answer true if the receiver has a current selection"

	^self selectableItems hasSelection!

hasSingleSelection
	"Answer true if the receiver has exactly one selection"

	^self selectableItems hasSingleSelection!

onSelectionChanged
	"Handler for a selection change in the receiver's view"

	self selectableItems onSelectionChanged!

onSelectionChanging: aSelectionChangingEvent
	"Handler to indicate that the receiver's selection is about to change.
	To prevent the proposed change under certain circumstances a handler can set the value of the <SelectionChangingEvent> to false."

	self view onSelectionChanging: aSelectionChangingEvent!

resetForItem: anObject
	"Private - Try to ensure that the receiver is set to display anObject if possible"

	!

resetForItems: aCollection 
	"Private - Try to ensure that the filter is set to display aCollection if possible"

	aCollection notEmpty ifTrue: [self resetForItem: aCollection first]!

resetSelection
	"Set the receiver to have no selection"

	self selectableItems resetSelection!

selectableItems
	"Private - Answer the name of the <selectableItems> component that actually handles the selectable items in the receiver"
	
	^self subclassResponsibility!

selection
	"Return the selected object or signals a NotFoundError if there is none"

	^self selectableItems selection!

selection: anObject
	"Select the first occurence of anObject in the receiver. If not present then signal a NotFoundError.
	Answer anObject"

	^self selectableItems selection: anObject
		ifAbsent: 
			[self resetForItem: anObject.
			self selectableItems selection: anObject]!

selection: anObject ifAbsent: exceptionHandler
	"Select the first occurence of the <Object>, anObject, in the receiver. 
	Answer anObject, or, if not present, the result of evaluating the
	<niladicValuable>, exceptionHandler."

	^self selectableItems selection: anObject
		ifAbsent: 
			[self resetForItem: anObject.
			self selectableItems selection: anObject ifAbsent: exceptionHandler]!

selectionIfNone: aBlock
	"Answer the current selection for the receiver or evaluate aBlock
	if there is none"

	^self selectableItems selectionIfNone: aBlock!

selectionOrNil
	"Return the selected object or nil if no selection."

	^self selectableItems selectionOrNil!

selectionOrNil: anObject
	"Select the first occurence of the <Object>, anObject, in the
	receiver. If anObject  is nil, then simply remove the existing
	selection. If anObject is not present then signal a NotFoundError.
	Answer anObject."

	^[self selectableItems selectionOrNil: anObject] on: NotFoundError
		do: 
			[:ex | 
			self resetForItem: anObject.
			self selectableItems selectionOrNil: anObject]!

selections
	"Answer a <sequencedReadableCollection> of the selected items.
	If there is no selection, then the collection will be empty."

	^self selectableItems selections!

selections: aSequencedReadableCollection
	"Select the specified collection of objects in the receiver. If any are not present then
	signal a NotFoundError. Answer the selections."

	^self selectableItems selections: aSequencedReadableCollection
		ifAbsent: 
			[self resetForItems: aSequencedReadableCollection.
			self selectableItems selections: aSequencedReadableCollection]!

selections: aCollection ifAbsent: exceptionHandler 
	"Select the specified collection of objects in the receiver. If any are not present then
	answer the result of evaluating the <niladicValuable>, exceptionHandler.
	Answer the selections."

	^self selectableItems selections: aCollection
		ifAbsent: 
			[self resetForItems: aCollection.
			self selectableItems selections: aCollection ifAbsent: exceptionHandler]! !
!SelectableItemsPresenter categoriesFor: #ensureSelectionVisible!public!selection! !
!SelectableItemsPresenter categoriesFor: #hasSelection!public!selection! !
!SelectableItemsPresenter categoriesFor: #hasSingleSelection!public!selection! !
!SelectableItemsPresenter categoriesFor: #onSelectionChanged!event handling!public! !
!SelectableItemsPresenter categoriesFor: #onSelectionChanging:!event handling!public! !
!SelectableItemsPresenter categoriesFor: #resetForItem:!event handling!private! !
!SelectableItemsPresenter categoriesFor: #resetForItems:!event handling!private! !
!SelectableItemsPresenter categoriesFor: #resetSelection!public!selection! !
!SelectableItemsPresenter categoriesFor: #selectableItems!private!selection! !
!SelectableItemsPresenter categoriesFor: #selection!public!selection! !
!SelectableItemsPresenter categoriesFor: #selection:!public!selection! !
!SelectableItemsPresenter categoriesFor: #selection:ifAbsent:!public!selection! !
!SelectableItemsPresenter categoriesFor: #selectionIfNone:!public!selection! !
!SelectableItemsPresenter categoriesFor: #selectionOrNil!public!selection! !
!SelectableItemsPresenter categoriesFor: #selectionOrNil:!public!selection! !
!SelectableItemsPresenter categoriesFor: #selections!public!selection! !
!SelectableItemsPresenter categoriesFor: #selections:!public!selection! !
!SelectableItemsPresenter categoriesFor: #selections:ifAbsent:!public!selection! !

SelectableItemsPresenter methodProtocol: #selectableItems attributes: #(#readOnly) selectors: #(#hasSelection #onSelectionChanged #onSelectionChanging: #resetSelection #selection #selection: #selection:ifAbsent: #selectionIfNone: #selectionOrNil #selectionOrNil:)!

