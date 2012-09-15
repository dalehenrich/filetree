## HOW TO INSTALL in GemStone

#### <a name="clone"></a>Clone FileTree git repository

```shell
    sudo mkdir /opt/git/
    sudo chmod og+rw /opt/git/
    cd /opt/git/
    git clone -b gemstone2.4 https://github.com/dalehenrich/filetree.git
```

#### <a name="bootstrap"></a>Bootstrap FileTree into image

```Smalltalk
    Gofer new
      url: 'http://ss3.gemstone.com/ss/FileTree';
      package: 'ConfigurationOfFileTree';
      load.
    ((Smalltalk at: #ConfigurationOfFileTree) project version: '1.0') load.  
```

####  <a name="loadlatest"></a>Load FileTree from Git repository

```Smalltalk
    Gofer new
        repository: (MCFileTreeRepository new directory: 
                    (ServerFileDirectory on: '/opt/git/filetree/repository/'));
        package: 'MonticelloFileTree-Core';
        package: 'MonticelloFileTree-FileDirectory-Utilities';
        load.
```

