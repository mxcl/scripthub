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


## `mash demo scriptisto`

A simple demo for scriptisto using `clang`, glib and `pkg-config`.

### Usage

```sh
$ mash demo scriptisto
```

&nbsp;


## `mash ai ui-sd`

Builds and run [Stable Diffusion web UI] with more advanced models.

### Usage

```sh
$ mash ai ui-sd
```

Additional arguments are passed to the app launcher.

### About

A browser interface based on Gradio library for Stable Diffusion.

### Modifications

* Builds to `~/.local/sd-webui`
* Prompts the user to download several initial default model choices
* Uses HuggingFace-cli to download the models to standardize model delivery across the AI app ecosystem
* Symlinks the models to `~/.local/share/models` to share across `mash ai ui` launchers

### Caveats

Some of the TUI selectable models require different arguments passed to the
launcher, so you may get garbage output if you don’t restart the UI.

[Stable Diffusion web UI]: https://github.com/AUTOMATIC1111/stable-diffusion-webui

&nbsp;


## `mash ai ui-sd.next`

Build and run [SD.Next], a popular fork of [Stable Diffusion web UI].

### Usage

```sh
$ mash ai ui-sd.next
```

Additional arguments are passed to the app launcher.

### Modifications

* Builds to `~/.local/SD.Next`
* Reuses models from the other `mash ai-ui` launchers

[SD.Next]: https://github.com/vladmandic/automatic

&nbsp;


## `mash ai ui-comfy`

Build and runs the [ComfyUI]: the most powerful and modular Stable Diffusion GUI and backend.

### Usage

```sh
$ mash ai ui-comfy
```

Additional arguments are passed to the app launcher.

### Modifications

* Builds to `~/.local/ComfyUI`.
* Reuses models from the other `mash ai-ui` launchers

[ComfyUI]: https://github.com/comfyanonymous/ComfyUI

&nbsp;



## `mash ai ui-sd-ux`

Build and runs [Stable Diffusion webUI-UX]: a fork of Stable Diffusion web UI
with a more user-friendly interface.

### Usage

```sh
$ mash ai ui-sd-ux
```

Additional arguments are passed to the app launcher.

### About

A bespoke, highly adaptable user interface for the Stable Diffusion, utilizing the powerful Gradio library. This cutting-edge browser interface offer an unparalleled level of customization and optimization for users, setting it apart from other web interfaces.

### Modifications

* Builds to `~/.local/sd-webui-ux`
* Reuses models from the other `mash ai-ui` launchers

[Stable Diffusion webUI-UX]: https://github.com/anapnoe/stable-diffusion-webui-ux

&nbsp;



## `mash ai ui-facefusion`

Build and runs [FaceFusion]: a next generation face swapper and enhancer.

### Usage

```sh
$ mash ai ui-facefusion
```

Additional arguments are passed to the app launcher.

### Modifications

* Builds to `~/.local/FaceFusion`

[FaceFusion]: https://github.com/facefusion/facefusion
