I write a package in filetree format as a git fast-import command.

My API includes the necessary code to start a commit and to end it (usefull for writing multiple packages in one commit, i.e. it has a save multiple versions entry).

It is cut from the MCWriter and friends hierarchy, because that hierarchy isn't properly designed for that sort of format.

Stream is an in-memory write stream on a string.

visiting is up to me, there is no clear pre-defined API, just that the FileTree code is working well and is a good starting point.

The structure is very complex and confusing, with multiple objects going back and forth and messing up everything :-(

All paths inside are strings (git fast-import only understands unix-like paths).

Paths are local to the root of the repository. I don't know if -C would work to make paths relative inside a repository (it could help).