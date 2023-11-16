# ScriptHub

## Stargazer

Make a stargazer video for any repo.

### Usage

```sh
$ shx stargazer
# ^^ prompts you for repo and other required inputs
```

### About

Wraps https://github.com/pomber/stargazer for your convenience.



## Setup Git GPG

Simple git commit signing.

### Details

Signing your git commits is important since there is no other way for the
commit to be verified as yours. Git is a transparent system that is easy to
spoof.

This script sets you up so from now on your commits are signed with [`bpb`],
and pings GitHub so that it can verify your commit signatures.

### Usage

```sh
$ shx setup-git-gpg
# ^^ tells you what it’s going to do and confirms before it does it
```

[`bpb`]: https://github.com/withoutboats/bpb

### About

`bpb` is a super simple signing utility written in rust. Typically signing
with GPG is a complex suite of steps and tools, which is why we prefer `bpb`.
