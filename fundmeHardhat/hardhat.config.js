require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-waffle");
require("dotenv").config();
require("hardhat-deploy");
require("hardhat-gas-reporter");
/** @type import('hardhat/config').HardhatUserConfig */
const Etherscan_API_KEY = process.env.Etherscan_API_KEY;
const RINKEBY_RPC_URL = process.env.RINKEBY_RPC_URL;
const RINKEBY_PRIVATE_KEY = process.env.RINKEBY_PRIVATE_KEY;
const COINMARKETCAP = process.env.COINMARKETCAP;

/** @type import('hardhat/config').HardhatUserConfig */

module.exports = {
  defaultNetowrk: "hardhat",

  networks: {

    localhost: {
      url: "http://127.0.0.1:8545/",
      //accounts: here we dont need to mention here. hardhat can handle all this stuff
      chainId: 31337,
    },
    rinkeby: {
      url: RINKEBY_RPC_URL,
      accounts: [RINKEBY_PRIVATE_KEY],
      chainId: 4,
      blockConfirmations:6
    },
  },
  solidity: {
    compilers: [{ version: "0.8.9" }, { version: "0.6.6" }],
  },
  etherscan: { apiKey: Etherscan_API_KEY },
  gasReporter: {
    enabled: true,
    outputFile: "gasReports.txt",
    noColors: true,
    currency: "USD",
    coinmarketcap: COINMARKETCAP,
    token: "MATIC",
  },
  namedAccounts: {
    deployer: {
      default: 0, //this is the index of pvt key that is mentioned in above given accounts array 
      user: {
        default: 1,
      },
    },
  }
}
