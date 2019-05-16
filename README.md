# git-memo 

Note-taking app built on pure git goodness.

`git-memo` is a developer journal or daybook implemented as a git repo. Want to
take and keep notes in git? Go for it.

## Why?

I wanted a simple place to take notes/memos while working. This includes
programming, researching, todos, and team communication. After searching around
for a good command-line note-taking tool, I found they all harshed my mellow
what with their opinions, marginality, and generally doing more than I need.
Meanwhile, git commands are a staple of my diet and now thoroughly engrained in
muscle-memory. I thought, why not just keep all these memos in git?

I know what you're thinking. That's so wasteful! A git repo will take up
SOOOOOOOOOOOOOOOO much more disk space than a simple text file and have so many
more features than you need. Yeah. So what? We're talking about tiny amounts of
disk so what does it matter. Plus, I like the features git has for listing out
the reflog and squashing and merging commits. This script accomplishes what I
want in a note-taking app in less than 50 LOC. YMMV.

## Features

git-memo adds your notes to a git repo as an empty commit. It allows you to
maintain different streams of notes as different branches. Why is this useful?
It's useful to me because I work on different projects for different clients. I
don't always remember to fill in my time-sheets while my work is still fresh in
mind. Apart from reviewing code commits, I wanted a way to record my client
activity whether or not I was committing code.

Maybe you need a simple way to report out your activity. With git branches,
this is as simple as logging out the messages.

If you want to see an overall log of your activity across all your projects,
just merge them into a single branch.

Best of all, because this is git, you can host your repo wherever you want and
your notes are your own. Want to back it up? Push (`git push --all <remote>`)
to a private github or bitbucket repo. Easy-peasy.

## Non-Features

- Working on a team? I suppose you could all keep notes and merge them
together. Sounds crazy but in a mad world only the mad are sane, so give it a
try if that's your thing.
- Want fancy formatting? Other than paragraphs and bullets and codeblocks,
you're pretty limited in markup. Oh well. The good news is that whatever
markup survives your `git commit` can be rendered later using whatever
markup engine you like.
- Want TODO lists and all that jazz, try [`org-mode`](https://orgmode.org/).

## Installation

### Linux

To use, source the functions to your session or add them to your .bashrc file.

```
echo "source /path/to/repo/git-memo.sh" >> $HOME/.bashrc
```

### OSX
I *think* this is POSIX-compliant but I haven't tested it. Go for it!

### Windows
Cygwin or the Linux Subsystem is your best bet.

## Using git-memo

To take a note just type `log`. This will open a familiar git commit prompt in
your default editor. `log` is just what I found easy to type, change
it to whatever alias you like:
```bash
alias mylog=new_git_memo
alias mylogl=list_git_memo
```



If you are working on a particular project, just add the project name like `log
myproj`

To see all your commit messages, use `logl` or `logl myproj` or just pop into
the git-memo dotdir and use git as you would normally.

That's really all there is to it. Enjoy!

## Contributing (aka ur bash-fu sux and ur stoopid)

If you notice an error in this code or a better way to make git do things it
really don't wanna do, submit a PR or fork it and go forth and prosper.
