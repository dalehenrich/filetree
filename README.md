## HOW TO INSTALL

The current version of **FileTree** has been tested in Pharo1.3 and Squeak4.3 and is 
expected to work in Pharo1.4:

  * [Pharo bootstrap](#pharo)
  * [Squeak bootstrap](#squeak)

### Bootstrap FileTree code
#### <a name="pharo"></a>Pharo1.3 and Pharo1.4

1. **Bootstrap FileTree into image:**

    ```Smalltalk
    Gofer new
        url: 'http://ss3.gemstone.com/ss/FileTree';
        package: 'ConfigurationOfFileTree';
        load.
    ((Smalltalk at: #ConfigurationOfFileTree) project version: '1.0') load.
    ```

2. **Clone FileTree git repository:**

    ```shell
    sudo mkdir /opt/git/
    sudo chmod og+rw /opt/git/
    cd /opt/git/
    git clone -b pharo1.3 https://github.com/dalehenrich/filetree.git
    ```

3. **Load latest version from git repository:**

    ```Smalltalk
    Gofer new
        repository: (MCFileTreeRepository new directory: 
                    (FileDirectory on: '/opt/git/filetree/repository/'));
        package: 'MonticelloFileTree-Core';
        load.
    ```


#### <a name="squeak"></a>Squeak 4.3

1. **Bootstrap FileTree into image:**

    ```Smalltalk
    Installer ss3
        project: 'FileTree';
        install: 'ConfigurationOfFileTree'. 
    ((Smalltalk at: #ConfigurationOfFileTree) project version: '1.0') load.
    ```

2. **Clone FileTree git repository:**

    ```shell
    sudo mkdir /opt/git/
    sudo chmod og+rw /opt/git/
    cd /opt/git/
    git clone -b squeak4.3 https://github.com/dalehenrich/filetree.git
    ```

3. **Load latest version from git repository:**

    ```Smalltalk
    Gofer new
        repository: (MCFileTreeRepository new directory: 
                    (FileDirectory on: '/opt/git/filetree/repository/'));
        package: 'MonticelloFileTree-Core';
        load.
    ```


