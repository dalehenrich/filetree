writing
flattenVersionInfos: aVersionInfo
    "this can get very deep, potentially, hence we do it iteratively"
    | infos thisInfos |
    infos := Set with: aVersionInfo.
    thisInfos := {aVersionInfo}.
    [thisInfos isEmpty] whileFalse: [ |newInfos|
        newInfos := OrderedCollection new.
        thisInfos do: [:info |
            infos
                addAll: (newInfos addAll: info ancestors); 
                addAll: (newInfos addAll: info stepChildren)].
        thisInfos := newInfos].
    ^ infos