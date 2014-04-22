private
postProcessVersionsDict: aVersionsDict
    " At this point, aVersionsDict's ancestors and stepChildren do only include 
      references to the respective actual versions by UUIDs. 
      We replace them by the actual ones.
   "
   aVersionsDict do: [:infoDict | 
        #(ancestors stepChildren) do: [:sub |
            infoDict at: sub put: ((infoDict at: sub) collect: [:idDict | aVersionsDict at: (idDict at: #id)])]].
   ^ aVersionsDict