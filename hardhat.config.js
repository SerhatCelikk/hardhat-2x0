require("@nomiclabs/hardhat-waffle");

const PRIVATE_KEY = "9ea5c3762c236ab586e48f94a7003c05cd809c1d383ee8ee8a30562eb05cef4a";


module.exports = {
    solidity: "0.8.2",
    networks: {

      hardhat: {
        forking: {
          url: "https://eth-rinkeby.alchemyapi.io/v2/sf7Mr0i_qcauE2bqJWAuR9syrrJ8y8vA",
          // blockNumber: 1234567
        }
      },

      mainnet: {
        url: `https://api.avax.network/ext/bc/C/rpc`,
          accounts: [`${PRIVATE_KEY}`]
      },
      fuji: {
        url: `https://api.avax-test.network/ext/bc/C/rpc`,
          accounts: [`${PRIVATE_KEY}`]
      }
    }
};