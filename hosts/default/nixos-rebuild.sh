#!/usr/bin/env bash
#a rebuild script based on the gist provided here https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5#file-nixos-rebuild-sh 
#also see ../../modules/commit.nix

set -e 

pushd /home/eggy/Documents/nix

#early return if nothing is different
if git diff --quiet '*'; then 
	echo "No changes detected, exiting ^_^"
	popd
	exit 0
fi
#autofomat your nix files
alejandra . &>/dev/null \
  || ( alejandra . ; echo "formatting failed!" && exit 1)


#shows your changes i think the original only checks for .nix files, ill do that someday 
echo "add info from commit.nix and the .sh file in to the readme as a todo and then delete me and the comments :D"
git diff -U0 '*.nix'

echo "NixOS Rebuilding <|:D "
sudo nixos-rebuild switch --flake ~/Documents/nix/#default &>nixos-switch.log || (cat nixos.switch.log | grep --color error && exit 1)

# get the current generation metadata
current=(nixos-rebuild list-generations | grep current)

git commit -am "$current"

#swap back :D
popd 

#notify all good >:3
notify-send -e "Nixos Rebuilt OK <|:3" --icon=software-update-available
