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

package bisq.asset.coins;

import bisq.asset.BitcoinAddressValidator;
import bisq.asset.Coin;

import org.bitcoinj.core.NetworkParameters;


//import org.bitcoinj.params.MainNetParams;
//import org.bitcoinj.params.RegTestParams;
//import org.bitcoinj.params.TestNet3Params;

import org.libdohj.params.DogecoinMainNetParams;
import org.libdohj.params.DogecoinRegTestParams;
import org.libdohj.params.DogecoinTestNet3Params;

public abstract class Bitcoin extends Coin {

    public Bitcoin(Network network, NetworkParameters networkParameters) {
        super("Radiocoin", "RADC", new BitcoinAddressValidator(networkParameters), network);
    }


    public static class Mainnet extends Bitcoin {

        public Mainnet() {
            super(Network.MAINNET, DogecoinMainNetParams.get());
        }
    }


    public static class Testnet extends Bitcoin {

        public Testnet() {
            super(Network.TESTNET, DogecoinTestNet3Params.get());
        }
    }


    public static class Regtest extends Bitcoin {

        public Regtest() {
            super(Network.REGTEST, DogecoinRegTestParams.get());
        }
    }
}
