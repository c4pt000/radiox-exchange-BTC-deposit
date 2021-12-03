java11-switch-on
echo "if missing java11-switch-on or not java 11 environment check https://github.com/c4pt000/Aqua-Term/java11-switch-on and java8-switch-on for java11 and java8 fast switching when both are installed"

echo "requires JAVA 11"
echo ""
echo "this is still highly experimental (unfinished treat as WIP)"
echo ""
echo "I hold no responsibility for any loss of funds"
echo ""
echo "treat this disclaimer as your own warning"
echo ""
echo "by reading this disclaimer you acknowledge I hold no responsibility"
echo ""
echo "since this is still an unfinished attempt at modifying BISQ P2P exchange to support Radiocoin functionality"
echo ""
echo ""
echo "if you are unsure you can quit now with CRTL-C"
echo ""
echo "program will pause for 5 seconds"
echo ""
sleep 5s
echo ""
echo ""
echo ""
echo "requires open ports 8333, 9001:9030/udp , 8000"
sleep 3s
./gradlew clean
./gradlew shadowJar -x test
cp -rf ./desktop/build/libs/desktop-1.7.5-SNAPSHOT-all.jar radiox-exchange.jar
./gradlew clean
rm -rf .gradle
ls -lh *jar
date
