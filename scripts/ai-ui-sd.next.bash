#!/usr/bin/env -S pkgx +git +python~3.10 +gum bash -eo pipefail

PREFIX="${XDG_DATA_HOME:-$HOME/.local}"
SRCDIR="${PREFIX}/SD.Next"

gum format <<EoMD
# SD.Next

* generated images are saved to \`$SRCDIR/outputs\`
* download additional models to \`$PREFIX/share/models\`

EoMD

echo  #spacer

if [ ! -f "$SRCDIR"/webui.sh ]; then
	gum confirm "clone to \`$SRCDIR?\`"
	mkdir -p "$SRCDIR"
	git -C "$SRCDIR"/.. clone https://github.com/vladmandic/automatic $(basename "$SRCDIR")
	cd "$SRCDIR"

	# needed in order to fix the `gradio` bug below
	./webui.sh --test

	# gradio 3.41.2 fails to load anything if any part in the install path has a `.` prefix 🤦‍♂️
    # https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues/13292
    # FIXME should stop doing this when fixed
    # https://github.com/gradio-app/gradio/pull/4303
    sed -i.bak '/is_dotfile =/s/= .*/= False/' "$SRCDIR/venv/lib/python3.10/site-packages/gradio/routes.py"
else
	cd "$SRCDIR"
	git fetch -pft
	git reset --hard origin/master
fi

# setup reusable model paths
mkdir -p "$PREFIX/share/models/checkpoints"
mkdir -p "$PREFIX/share/models/embeddings"
mkdir -p "$PREFIX/share/models/loras"
mkdir -p "$PREFIX/share/models/vae"

cd models
rm -rf Stable-diffusion
ln -s ../../share/models/checkpoints Stable-diffusion
rm -rf VAE
ln -s ../../share/models/vae VAE
rm -rf Lora
ln -s ../../share/models/loras Lora
cd ..
rm -rf embeddings
ln -s ../share/models/embeddings

echo  #spacer

exec ./webui.sh --autolaunch "$@"
