actions
refresh
	super refresh.
	repository branch: nil.
	self changed: #gitNeedPush