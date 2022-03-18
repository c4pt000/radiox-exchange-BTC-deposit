/*
 * This file is part of Bisq.
 *
 * Bisq is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or (at
 * your option) any later version.
 *
 * Bisq is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with Bisq. If not, see <http://www.gnu.org/licenses/>.
 */

package bisq.common.config;

import org.bitcoinj.core.NetworkParameters;



//import org.bitcoinj.params.MainNetParams;
//import org.bitcoinj.params.RegTestParams;
//import org.bitcoinj.params.TestNet3Params;


import org.libdohj.params.DogecoinMainNetParams;
import org.libdohj.params.DogecoinRegTestParams;
import org.libdohj.params.DogecoinTestNet3Params;

import lombok.Getter;

public enum BaseCurrencyNetwork {
    RADC_MAINNET(DogecoinMainNetParams.get(), "RADC", "MAINNET", "Radiocoin"),
    RADC_TESTNET(DogecoinTestNet3Params.get(), "RADC", "TESTNET", "Radiocoin"),
    RADC_REGTEST(DogecoinRegTestParams.get(), "RADC", "REGTEST", "Radiocoin"),
    RADC_DAO_TESTNET(DogecoinRegTestParams.get(), "RADC", "REGTEST", "Radiocoin"), // server side regtest until v0.9.5
    RADC_DAO_BETANET(DogecoinMainNetParams.get(), "RADC", "MAINNET", "Radiocoin"), // mainnet test genesis
    RADC_DAO_REGTEST(DogecoinRegTestParams.get(), "RADC", "REGTEST", "Radiocoin"); // server side regtest after v0.9.5, had breaking code changes so we started over again

    @Getter
    private final NetworkParameters parameters;
    @Getter
    private final String currencyCode;
    @Getter
    private final String network;
    @Getter
    private final String currencyName;

    BaseCurrencyNetwork(NetworkParameters parameters, String currencyCode, String network, String currencyName) {
        this.parameters = parameters;
        this.currencyCode = currencyCode;
        this.network = network;
        this.currencyName = currencyName;
    }

    public boolean isMainnet() {
        return "RADC_MAINNET".equals(name());
    }

    public boolean isTestnet() {
        return "RADC_TESTNET".equals(name());
    }

    public boolean isDaoTestNet() {
        return "RADC_DAO_TESTNET".equals(name());
    }

    public boolean isDaoRegTest() {
        return "RADC_DAO_REGTEST".equals(name());
    }

    public boolean isDaoBetaNet() {
        return "RADC_DAO_BETANET".equals(name());
    }

    public boolean isRegtest() {
        return "RADC_REGTEST".equals(name());
    }

    public long getDefaultMinFeePerVbyte() {
        return 15;  // 2021-02-22 due to mempool congestion, increased from 2
    }
}
