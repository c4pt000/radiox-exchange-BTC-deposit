./gradlew desktop:package -x test
cp -rf ./desktop/build/current-PACKAGE/binaries/radiox_1.7.5-1_amd64.deb .
ls -lh radiox_1.7.5-1_amd64.deb
date
echo '
dpkg -x radiox_1.7.5-1_amd64.deb /
'
echo 'for linux packaging: with deb pkg installed
sh install_and_run.sh
'
