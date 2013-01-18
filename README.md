*Monticello repository for directory-based Monticello packages enabling the use of git, svn, etc. for 
managing Smalltalk source code.*


## Installing

The current version of **FileTree** has been tested in GemStone2.4.4.1 (GLASS 1.0-beta.8.7.1), 
Pharo1.1, Pharo1.2, Pharo1.3, PHaro1.4, Pharo2.0, Squeak4.3, Squeak4.4:

```Smalltalk
Gofer new
      url: 'http://ss3.gemstone.com/ss/FileTree';
      package: 'ConfigurationOfFileTree';
      load.
    ((Smalltalk at: #ConfigurationOfFileTree) project version: #'stable') load.
```

## Contributing

Here are some guidelines on contributing to the project:

 * [use personal fork](https://github.com/dalehenrich/filetree/tree/master/doc/Contribute.md#forkme)
 * [use dialect-specific branching](https://github.com/dalehenrich/filetree/tree/master/doc/Contribute.md#branching)
 * [use topic branches](https://github.com/dalehenrich/filetree/tree/master/doc/Contribute.md#topicbranches)
 * [unit tests in separate repository](https://github.com/dalehenrich/filetree/tree/master/doc/Contribute.md#tests)

## Travis CI Status

**gemstone2.4**

**pharo1.1 & pharo1.2** : [![Build Status](https://secure.travis-ci.org/dalehenrich/filetree.png?branch=pharo1.1)](http://travis-ci.org/dalehenrich/filetree) 

**pharo1.3** : [![Build Status](https://secure.travis-ci.org/dalehenrich/filetree.png?branch=pharo1.3)](http://travis-ci.org/dalehenrich/filetree) 

**pharo1.4** : [![Build Status](https://secure.travis-ci.org/dalehenrich/filetree.png?branch=pharo1.4)](http://travis-ci.org/dalehenrich/filetree)

**pharo2.0** : [![Build Status](https://secure.travis-ci.org/dalehenrich/filetree.png?branch=pharo2.0)](http://travis-ci.org/dalehenrich/filetree)

**squeak4.3 & squeak4.4** : [![Build Status](https://secure.travis-ci.org/dalehenrich/filetree.png?branch=squeak4.3)](http://travis-ci.org/dalehenrich/filetree) 

**configuration** : [![Build Status](https://secure.travis-ci.org/dalehenrich/filetree.png?branch=configuration)](http://travis-ci.org/dalehenrich/filetree) 


