


echo '

# as root

cd seednode
./gradlew build -x test shadowJar
cp -rf ./build/libs/seednode-all.jar radiox-seednode.jar

java -jar radiox-seednode.jar &

run this script once the seednode is running
./radiox-seednode-address.sh to show your current ip and onion

 
  "localaddresses": [
      "address": "71.xxx.xxx.xxx",

(an example tor onion address)
rnxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxzjiotojsssfocjlpfx37fhqd.onion

then launch radiox-exchange.jar with --seedNodes= option and --btcNodes option (replace foo.onion for your .onion address)

connect with example java -jar radiox-exchange.jar --seedNodes=foo.onion:8000 --btcNodes=foo.onion:8333
'
java -jar radiox-exchange.jar --seedNodes=j53zpx2eji2n4m5eyypnxpg5euirwyrculda3ivwlzw45lwsc56euzad.onion:8000 --btcNodes=j53zpx2eji2n4m5eyypnxpg5euirwyrculda3ivwlzw45lwsc56euzad.onion:8333
