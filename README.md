FileTree-based repository for http://ss3.gemstone.com/ss/FileTree.html

Bootstrap into Pharo 1.3 image using:

  Gofer new
    url: 'http://ss3.gemstone.com/ss/FileTree';
    package: 'ConfigurationOfFileTree';
    load.
  ((Smalltalk at: #ConfigurationOfFileTree) project version: '1.0') load.

Then use git to clone this repository for FileTree-based experience ... Primary work on FileTree takes place here with periodic checkpoints to the ss3 repository.
