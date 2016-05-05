# My dotfiles

## Resources / links

Here are some resources to check out, maybe someday:

* [Sync your Preferences Across Multiple Computers with 
  GIT](http://codoki.com/2015/02/03/sync-dotfiles-across-multiple-computers/)
* [https://dotfiles.github.io/]()
* [awesome-dotfiles](https://github.com/webpro/awesome-dotfiles)
* [Mathiasbynens (legendary) dotfile for OS 
  X](https://github.com//dotfiles/blob/master/.osx)


## .gitconfig

I have implemented a `git nuke` feature, which sends a repo working directory
back to its pristine state (more or less). It uses custom git config data.
There are three aliases:

- `git nuke` - to see a dry run of the changes that would be made. This is also
  useful as a general way to see what cruft is in your working tree
- `git nukem` - really do it
- `git nonuke [opts]` - manage a list of files that even this tool ignores. 
  This is an alias for `git config`, and takes the same options. For example:
    - `git nonuke --get-all` - list all the nonuke files
    - `git nonuke --add [file]`
    - `git nonuke --unset [file]`

Here is how it works:

```
$ git nuke
DRY RUN. Use nukem to clean:       #=>  nothing to nuke

$ # Add a local settings file, not in the git repo; add it to .gitignore
$ touch settings-local.yaml
$ echo settings-local.yaml >> .gitignore
$ git add .gitignore && git commit -am 'add local settings to .gitignore'
[master 70924fc] add local settings to .gitignore ...

$ git nuke
DRY RUN. Use nukem to clean:
Would remove settings-local.yaml   #=>  uh-oh, it wants to get rid of this

$ git nonuke --add settings-local.yaml
DRY RUN. Use nukem to clean:       #=>  nothing to nuke
```

In the aliases for `nuke` and `nukem`, you have to use two `f`s in the options, 
because that makes sure that git cleans even clones of other repos, that are in 
subdirectories of this one. See [this blog 
post](https://major.io/2012/10/24/using-git-clean-to-remove-subdirectories-containing-git-repositories/).

