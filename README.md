# My dotfiles

## Resources / links

Here are some resources to check out, maybe someday:

* [Sync your Preferences Across Multiple Computers with 
  GIT](http://codoki.com/2015/02/03/sync-dotfiles-across-multiple-computers/)
* [https://dotfiles.github.io/]()
* [awesome-dotfiles](https://github.com/webpro/awesome-dotfiles)
* [Mathiasbynens (legendary) dotfile for OS 
  X](https://github.com//dotfiles/blob/master/.osx)


## Bash startup scripts

See this post for a good, quick summary: [Bash startup scripts on Linux and Mac 
OS X](https://coderwall.com/p/u003pa/bash-startup-scripts-on-linux-and-mac-os-x).

Two things determine what startup script get executed:

* Is the shell interactive or not? That is, are standard in/out tied to a
  terminal?
* Is it a login shell?

Typically, after you've logged into a machine and started up a windows manager,
any new terminals you open are *not* login shells.

Login shells look for /etc/profile, ~/.profile, ~/.bash_login, or ~/.bash_profile,
and source the first one only.

Non-login shells source .bashrc.

***Never put any commands that produce output in .bashrc!*** This causes 
ssh to break.

Mac OS X has a quirk in that the terminal program (and iterm, too) 
starts new shells as login
shells. Fix by telling it to start new shells with /bin/bash.


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

## Atom

Put these into ~/.atom/

* [keymap.cson](.atom/keymap.cson) - stole from [this gist](https://gist.github.com/kndl/9576567).


