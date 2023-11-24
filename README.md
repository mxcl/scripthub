# mxcl’s ScriptHub Scripts

See https://hub.pkgx.sh if you’re confused.


## Chat

Easy local AI chat.

### Details

Using LLaMA.cpp, huggingface-cli and a shit-tonne of googling we have fine
tuned the chat interface of LLaMA.cpp for a variety of models.

### Usage

```sh
$ hubx chat
```

Or to avoid the TUI chooser:

```sh
$ hubx chat [--dolphin-mistral|--llama2|--llama-13b]
```

## Youtube Transcribe

Transcribe YouTube videos.

### Details

Locally transcribe a remote YouTube video using yt-dlp, ffmpeg, whisper.cpp
downloading the whisper model using huggingface-cli.

### Usage

```sh
$ hubx youtube-transcribe <YOUTUBE-URL>
# ^^ you probs need to quote that URL
```

Additional arguments are passed to `whisper.cpp`, eg. `--no-timestamps` or
`-nt` for no timestamps. Use `pkgx whisper.cpp --help` for more options.

whisper.cpp is very noisy, you can hide all the informational messages by
sending stderr to null:

```sh
$ hubx youtube-transcribe youtu.be/xiq5euezOEQ 2>/dev/null
```

Redirecting stdout to a file means that file contains only the transcript:

```sh
$ hubx youtube-transcribe youtu.be/xiq5euezOEQ -nt 2> transcription.txt
```


## Stargazer

Make a stargazer video for any repo.

### Usage

```sh
$ hubx stargazer
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
$ hubx setup-git-gpg
# ^^ tells you what it’s going to do and confirms before it does it
```

[`bpb`]: https://github.com/withoutboats/bpb

### About

`bpb` is a super simple signing utility written in rust. Typically signing
with GPG is a complex suite of steps and tools, which is why we prefer `bpb`.
