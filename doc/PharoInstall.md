## HOW TO INSTALL in Pharo

#### <a name="clone"></a>Clone FileTree git repository

```shell
    sudo mkdir /opt/git/
    sudo chmod og+rw /opt/git/
    cd /opt/git/
    # choose your branch here (pharo1.3, pharo1.4, pharo2.0)
    git clone -b PHARO_BRANCH https://github.com/dalehenrich/filetree.git
```

Where **PHARO_BRANCH**: pharo1.1 (for pharo1.1 or pharo1.2), pharo1.3. pharo1.4, or pharo2.0.

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
                    (FileDirectory on: '/opt/git/filetree/repository/'));
        package: 'MonticelloFileTree-Core';
        package: 'MonticelloFileTree-FileDirectory-Utilities';
        load.
```

