"Filed out from Dolphin Smalltalk 2000 release 4.01"!

RefactoringTest subclass: #AddInstanceVariableTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
AddInstanceVariableTest comment: ''!

AddInstanceVariableTest guid: (GUID fromString: '{95C6C15D-0113-4AE8-81D5-766BECE4B2AC}')!

!AddInstanceVariableTest categoriesForClass!Refactory-Testing! !
!AddInstanceVariableTest methodsFor!

setUp
	super setUp.
	model := Compiler evaluate: (self readFile: 'AbstractVariableTestData.st')!

testAddInstanceVariable
	| refactoring |
	refactoring := AddInstanceVariableRefactoring variable: 'asdf'
				class: TransformationRuleTest.
	self executeRefactoring: refactoring.
	self assert: ((refactoring model classNamed: #TransformationRuleTest) 
				directlyDefinesInstanceVariable: 'asdf')!

testAddToModel
	| refactoring |
	model := RBNamespace new.
	model name: 'Add instance variable'.
	model 
		defineClass: 'Object subclass: #FOOBAR 
				instanceVariableNames: ''fdsa'' 	
				classVariableNames: ''''
				poolDictionaries: ''''
				category: ''Refactory-Test data'''.
	refactoring := AddInstanceVariableRefactoring 
				model: model
				variable: 'asdf'
				class: (model classNamed: #FOOBAR).
	self executeRefactoring: refactoring.
	self assert: ((refactoring model classNamed: #FOOBAR) 
				directlyDefinesInstanceVariable: 'asdf')!

testAlreadyExistingName
	self
		shouldFail: (AddInstanceVariableRefactoring variable: 'class'
					class: TransformationRuleTest);
		shouldFail: (AddInstanceVariableRefactoring variable: 'name'
					class: TransformationRuleTest)!

testModelAlreadyExistingName
	| refactoring |
	refactoring := AddInstanceVariableRefactoring 
				model: model
				variable: 'instVarName1'
				class: (model classNamed: #Bar).
	self shouldFail: refactoring!

testModelMetaclassAlreadyExistingName
	| refactoring |
	(model metaclassNamed: #Foo) addInstanceVariable: 'instVarName1'.
	refactoring := AddInstanceVariableRefactoring 
				model: model
				variable: 'instVarName1'
				class: (model classNamed: #Bar).
	self shouldFail: refactoring!

testNewExistingName
	| refactoring |
	model := RBNamespace new.
	model name: 'Add instance variable'.
	model 
		defineClass: 'Object subclass: #FOOBAR 
				instanceVariableNames: ''asdf'' 	
				classVariableNames: ''''
				poolDictionaries: ''''
				category: ''Refactory-Test data'''.
	refactoring := AddInstanceVariableRefactoring 
				model: model
				variable: 'asdf'
				class: (model classNamed: #FOOBAR).
	self shouldFail: refactoring!

testNewHierarchyExistingName
	| refactoring |
	model := RBNamespace new.
	model name: 'Add instance variable'.
	model 
		defineClass: 'Object subclass: #FOOBAR 
				instanceVariableNames: ''asdf'' 	
				classVariableNames: ''''
				poolDictionaries: ''''
				category: ''Refactory-Test data'''.
	model 
		defineClass: 'FOOBAR subclass: #BARFOO 
				instanceVariableNames: '''' 	
				classVariableNames: ''''
				poolDictionaries: ''''
				category: ''Refactory-Test data'''.
	refactoring := AddInstanceVariableRefactoring 
				model: model
				variable: 'asdf'
				class: (model classNamed: #BARFOO).
	self shouldFail: refactoring! !
!AddInstanceVariableTest categoriesFor: #setUp!public!set up! !
!AddInstanceVariableTest categoriesFor: #testAddInstanceVariable!public!tests! !
!AddInstanceVariableTest categoriesFor: #testAddToModel!public!tests! !
!AddInstanceVariableTest categoriesFor: #testAlreadyExistingName!failure tests!public! !
!AddInstanceVariableTest categoriesFor: #testModelAlreadyExistingName!failure tests!public! !
!AddInstanceVariableTest categoriesFor: #testModelMetaclassAlreadyExistingName!failure tests!public! !
!AddInstanceVariableTest categoriesFor: #testNewExistingName!failure tests!public! !
!AddInstanceVariableTest categoriesFor: #testNewHierarchyExistingName!failure tests!public! !
