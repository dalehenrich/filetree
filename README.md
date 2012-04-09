## HOW TO INSTALL

The current version of **FileTree** has been tested in GemStone2.4.4.1 (GLASS 1.0-beta.8.7.1), Pharo1.3 and Squeak4.3 and is 
expected to work in Pharo1.4:

1. Clone git repository:

    * [GemStone](#gemstone)
    * [Pharo](#pharo)
    * [Squeak](#squeak)

2. Bootstrap FileTree into image

    * [GemStone and Pharo](#bootstrapcommon)
    * [Squeak](#bootstrapsqueak)

3. Load latest FileTree from git repository

    * [all platforms](#loadlatest)

#### <a name="gemstone"></a>Clone FileTree git repository for GemStone

    ```shell
    sudo mkdir /opt/git/
    sudo chmod og+rw /opt/git/
    cd /opt/git/
    git clone -b gemstone2.4 https://github.com/dalehenrich/filetree.git
    ```

[**Bootstrap image**](#bootstrapcommon)

#### <a name="pharo"></a>Clone FileTree git repository for Pharo

    ```shell
    sudo mkdir /opt/git/
    sudo chmod og+rw /opt/git/
    cd /opt/git/
    git clone -b pharo1.3 https://github.com/dalehenrich/filetree.git
    ```

[**Bootstrap image**](#bootstrapcommon)

#### <a name="squeak"></a>Clone FileTree git repository for Squeak

    ```shell
    sudo mkdir /opt/git/
    sudo chmod og+rw /opt/git/
    cd /opt/git/
    git clone -b squeak4.3 https://github.com/dalehenrich/filetree.git
    ```

[**Bootstrap image**](#bootstrapsqueak)

#### <a name="bootstrapcommon"></a>Bootstrap FileTree into GemStone or Pharo Image

    ```Smalltalk
    Gofer new
      url: 'http://ss3.gemstone.com/ss/FileTree';
      package: 'ConfigurationOfFileTree';
      load.
    ((Smalltalk at: #ConfigurationOfFileTree) project version: '1.0') load.  
    ```

[**Load from Git repository**](#loadlatest)

#### <a name="bootstrapsqueak"></a>Bootstrap FileTree into Squeak Image

    ```Smalltalk
    Installer ss3
        project: 'FileTree';
        install: 'ConfigurationOfFileTree'. 
    ((Smalltalk at: #ConfigurationOfFileTree) project version: '1.0') load.
    ```

[**Load from Git repository**](#loadlatest)

####  <a name="loadlatest"></a>Load FileTree from Git repository

    ```Smalltalk
    Gofer new
        repository: (MCFileTreeRepository new directory: 
                    (FileDirectory on: '/opt/git/filetree/repository/'));
        package: 'MonticelloFileTree-Core';
        load.
    ```

