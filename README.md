# [mxcl/mash](https://mash.pkgx.sh/u/mxcl/)

## `mash ai chat`

Secure, private, local, multi-model, multi-engine, AI chat.

### Details

Using LLaMA.cpp, huggingface-cli and a shit-tonne of googling we have fine
tuned the chat interface of LLaMA.cpp for a variety of models.

### Usage

```sh
$ mash ai chat
```

Or to avoid the TUI chooser:

```sh
$ mash ai chat [--dolphin-mistral|--llama2|--llama-13b]
```

&nbsp;


## `mash ai youtube-transcribe`

Transcribe YouTube videos fast with local AI.

### Details

Locally transcribe a remote YouTube video using `yt-dlp`, `ffmpeg`,
`whisper.cpp` downloading the whisper model using `huggingface-cli`.

### Usage

```sh
$ mash ai youtube-transcribe <YOUTUBE-URL>
# ^^ you probs need to quote that URL
```

Additional arguments are passed to `whisper.cpp`, eg. `--no-timestamps` or
`-nt` for no timestamps. Use `pkgx whisper.cpp --help` for more options.

whisper.cpp is very noisy, you can hide all the informational messages by
sending stderr to null:

```sh
$ mash ai youtube-transcribe youtu.be/xiq5euezOEQ 2>/dev/null
```

Redirecting stdout to a file means that file contains only the transcript:

```sh
$ mash ai youtube-transcribe youtu.be/xiq5euezOEQ -nt 2> transcription.txt
```

&nbsp;


## `mash gh stargazer`

Make a stargazer video for any GitHub repo.

### Usage

```sh
$ mash gh stargazer
# ^^ prompts you for repo and other required inputs
```

### About

Wraps https://github.com/pomber/stargazer for your convenience.

&nbsp;


## `mash git setup-gpg`

Configure `git` & GitHub to sign ur commits.

### Details

Signing your Git commits is important since there is no other way for the
commit to be verified as yours. Git is a transparent system that is easy to
spoof.

This script sets you up so from now on your commits are signed with [`bpb`],
and pings GitHub so that it can verify your commit signatures.

### Usage

```sh
$ mash git setup-gpg
# ^^ tells you what it’s going to do and confirms before it does it
```

[`bpb`]: https://github.com/withoutboats/bpb

### About

`bpb` is a super simple signing utility written in rust. Typically signing
with GPG is a complex suite of steps and tools, which is why we prefer `bpb`.
