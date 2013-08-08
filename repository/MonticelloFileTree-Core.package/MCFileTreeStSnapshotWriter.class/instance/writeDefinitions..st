initialize-release
writeDefinitions: aCollection
  | basePath extensionClasses extensionMethodDefinitions methodHolders |
  self writeBasicDefinitions: aCollection.
  basePath := 'snapshot' , ServerFileDirectory slash , 'classes'
    , ServerFileDirectory slash.
  extensionClasses := OrderedCollection new.
  extensionMethodDefinitions := OrderedCollection new.
  methodHolders := self classDefinitions.
  self methodDefinitions
    keysAndValuesDo: [ :className :extensionMethods | 
      methodHolders
        at: className
        ifAbsent: [ 
          extensionClasses add: className.
          extensionMethodDefinitions addAll: extensionMethods ] ].
  extensionClasses
    do: [ :className | self methodDefinitions removeKey: className ].
  self
    writeMethodHolderDefinitions: self classDefinitions
    extension: '.class'
    to: basePath
    do: [ :definition :classPath | self writeClassDefinition: definition to: classPath ].
  basePath := 'snapshot' , ServerFileDirectory slash , 'extensions'
    , ServerFileDirectory slash.
  extensionMethodDefinitions
    do: [ :methodDefinition | 
      | methodPath |
      methodPath := basePath , methodDefinition className , '.class'
        , ServerFileDirectory slash
        ,
          (methodDefinition classIsMeta
            ifTrue: [ 'class' ]
            ifFalse: [ 'instance' ])
        , ServerFileDirectory slash.
      self writeMethodDefinition: methodDefinition to: methodPath ]