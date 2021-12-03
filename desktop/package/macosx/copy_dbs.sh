#!/bin/bash

cd $(dirname $0)/../../../

version="1.7.5"

# Set RADIOX_DIR as environment var to the path of your locally synced RadioX data directory e.g. RADIOX_DIR=~/Library/Application\ Support/RadioX

dbDir=$RADIOX_DIR/btc_mainnet/db
resDir=p2p/src/main/resources

# Only commit new TradeStatistics3Store if you plan to add it to
# https://github.com/bisq-network/radiox/blob/0345c795e2c227d827a1f239a323dda1250f4e69/common/src/main/java/radiox/common/app/Version.java#L40 as well.
cp "$dbDir/TradeStatistics3Store" "$resDir/TradeStatistics3Store_${version}_BTC_MAINNET"
cp "$dbDir/AccountAgeWitnessStore" "$resDir/AccountAgeWitnessStore_${version}_BTC_MAINNET"
cp "$dbDir/DaoStateStore" "$resDir/DaoStateStore_BTC_MAINNET"
cp "$dbDir/SignedWitnessStore" "$resDir/SignedWitnessStore_BTC_MAINNET"

# Only to be updated when required
# cp "$dbDir/ProposalStore" "$resDir/ProposalStore_BTC_MAINNET"
# cp "$dbDir/TempProposalStore" "$resDir/TempProposalStore_BTC_MAINNET"
# cp "$dbDir/BlindVoteStore" "$resDir/BlindVoteStore_BTC_MAINNET"
