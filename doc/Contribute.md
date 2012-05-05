## Guidelines for Contributing

### <a name="forkme"></a> Work on a personal fork
You should fork the FileTree repository into your own github account and do the development work there. 

Issue a [pull request](http://help.github.com/send-pull-requests/) when you have things working.

### <a name="branching"></a> Work on a dialect-specific branch
There are 4 dialect-specific branches:

 * [master](https://github.com/dalehenrich/filetree/tree/master)
 * [gemstone2.4](https://github.com/dalehenrich/filetree/tree/gemstone2.4)
 * [pharo1.3](https://github.com/dalehenrich/filetree/tree/pharo1.3)
 * [squeak4.3](https://github.com/dalehenrich/filetree/tree/squeak4.3)

The **master branch** is where the *common code* resides. Typically
specific commits are 
[cherry-picked](http://technosophos.com/content/git-cherry-picking-move-small-code-patches-across-branches) from a dialect-specific branch.

The **master branch** changes are then merged individually into each dialect-specific
branch.

### <a name="topicbranches"></a> Use topic branches

Once you've forked the FileTree project and cloned the repository to your local disk add a [topic branch](https://github.com/dchelimsky/rspec/wiki/Topic-Branches) rooted at the HEAD of the dialect-specific branch you are working on. Here's an example using the **pharo branch**:

```shell
  git checkout -b Issue143 pharo1.3
```

Do all of your work on this branch and when it is time to merge your work back into the 
**pharo branch** use the following:

```shell
  git checkout pharo1.3
  git merge Issue143
  git push origin pharo1.3
```

### <a name="tests"></a> FileTree tests

I'm trying a little experiment with the tests in FileTree. In Monticello it is very painful to create good tests that exercise loads with various attributes, because you have to have a large number of separate tests packages and it is a royal pain to keep all of the test packages in synch ... You can build a bunch of resources for dictionary-based repositories (as is done for Gofer and Metacello), but it is still painful to manage the resources.

For FileTree, I've decided to create a suite of [test repositories](https://github.com/dalehenrich/filetree/tree/master/tests/testRepositories). Currently there are two repositories 
[ver01](https://github.com/dalehenrich/filetree/tree/master/tests/testRepositories/ver01) and 
[ver02](https://github.com/dalehenrich/filetree/tree/master/tests/testRepositories/ver02), that contain slightly different versions of the 
[Cypress-Mocks package](https://github.com/CampSmalltalk/Cypress-Mocks). 

The tests themselves are located in a 
[separate test repository](https://github.com/dalehenrich/filetree/tree/master/tests/repository). Loading the tests involves attaching to the test repository and loading the code:

```Smalltalk
  Gofer new
    repository: (MCFileTreeRepository new directory: 
                    (FileDirectory on: '/opt/git/filetree/tests/repository/'));
    package: 'MonticelloFileTree-Tests';
    load.
```
