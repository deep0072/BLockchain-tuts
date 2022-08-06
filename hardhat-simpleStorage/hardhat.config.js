require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();
require("./tasks/blockNumber");
require("hardhat-gas-reporter");

const Etherscan_API_KEY = process.env.Etherscan_API_KEY;
const RINKEBY_RPC_URL = process.env.RINKEBY_RPC_URL;
const RINKEBY_PRIVATE_KEY = process.env.RINKEBY_PRIVATE_KEY;
const COINMARKETCAP =   process.env.COINMARKETCAP

/** @type import('hardhat/config').HardhatUserConfig */

module.exports = {
  defaultNetowrk: "hardhat",
  networks: {
    rinkeby: {
      url: RINKEBY_RPC_URL,
      accounts: [RINKEBY_PRIVATE_KEY],
      chainId: 4,
    },
    localhost: {
      url: "http://127.0.0.1:8545/",
      //accounts: here we dont need to mention here. hardhat can handle all this stuff
      chainId: 31337,
    },
  },
  solidity: "0.8.9",
  etherscan: { apiKey: Etherscan_API_KEY },
  gasReporter:{
    enabled:true,
    outputFile: "gasReports.txt",
    noColors:true,
    currency:"USD",
    coinmarketcap: COINMARKETCAP
  }
};
