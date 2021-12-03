#!/bin/bash

cd ../../

version="1.7.5-SNAPSHOT"

target_dir="releases/$version"

# Set RADIOX_GPG_USER as environment var to the email address used for gpg signing. e.g. RADIOX_GPG_USER=manfred@bitsquare.io
# Set RADIOX_VM_PATH as environment var to the directory where your shared folders for virtual box are residing

vmPath=$RADIOX_VM_PATH
linux64=$vmPath/vm_shared_ubuntu
win64=$vmPath/vm_shared_windows
macos=$vmPath/vm_shared_macosx

deployDir=deploy

rm -r $target_dir

mkdir -p $target_dir

# sig key mkarrer
cp "$target_dir/../../package/F379A1C6.asc" "$target_dir/"
# sig key cbeams
cp "$target_dir/../../package/5BC5ED73.asc" "$target_dir/"
# sig key Christoph Atteneder
cp "$target_dir/../../package/29CDFD3B.asc" "$target_dir/"
# signing key
cp "$target_dir/../../package/signingkey.asc" "$target_dir/"

dmg="RadioX-$version.dmg"
cp "$macos/$dmg" "$target_dir/"

deb="radiox_$version-1_amd64.deb"
deb64="RadioX-64bit-$version.deb"
cp "$linux64/$deb" "$target_dir/$deb64"

rpm="radiox-$version-1.x86_64.rpm"
rpm64="RadioX-64bit-$version.rpm"
cp "$linux64/$rpm" "$target_dir/$rpm64"

exe="RadioX-$version.exe"
exe64="RadioX-64bit-$version.exe"
cp "$win64/$exe" "$target_dir/$exe64"

rpi="jar-lib-for-raspberry-pi-$version.zip"
cp "$macos/$rpi" "$target_dir/"

# create file with jar signatures
cat "$macos/desktop-$version-all-mac.jar.SHA-256" \
"$linux64/desktop-$version-all-linux.jar.SHA-256" \
"$win64/desktop-$version-all-win.jar.SHA-256" > "$target_dir/RadioX-$version.jar.txt"

sed -i '' '1 s_^_macOS: _' "$target_dir/RadioX-$version.jar.txt"
sed -i '' '2 s_^_linux: _' "$target_dir/RadioX-$version.jar.txt"
sed -i '' '3 s_^_windows: _' "$target_dir/RadioX-$version.jar.txt"

cd "$target_dir"

echo Create signatures
gpg --digest-algo SHA256 --local-user $RADIOX_GPG_USER --output $dmg.asc --detach-sig --armor $dmg
gpg --digest-algo SHA256 --local-user $RADIOX_GPG_USER --output $deb64.asc --detach-sig --armor $deb64
gpg --digest-algo SHA256 --local-user $RADIOX_GPG_USER --output $rpm64.asc --detach-sig --armor $rpm64
gpg --digest-algo SHA256 --local-user $RADIOX_GPG_USER --output $exe64.asc --detach-sig --armor $exe64
gpg --digest-algo SHA256 --local-user $RADIOX_GPG_USER --output $rpi.asc --detach-sig --armor $rpi

echo Verify signatures
gpg --digest-algo SHA256 --verify $dmg{.asc*,}
gpg --digest-algo SHA256 --verify $deb64{.asc*,}
gpg --digest-algo SHA256 --verify $rpm64{.asc*,}
gpg --digest-algo SHA256 --verify $exe64{.asc*,}
gpg --digest-algo SHA256 --verify $rpi{.asc*,}

mkdir $win64/$version
cp -r . $win64/$version

open "."
