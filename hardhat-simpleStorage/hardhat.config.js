require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();
require("@nomiclabs/hardhat-etherscan");

const RINKEBY_RPC_URL = process.env.RINKEBY_RPC_URL;
const RINKEBY_PRIVATE_KEY = process.env.RINKEBY_PRIVATE_KEY;
const Etherscan_API_KEY = process.env.Etherscan_API_KEY;
console.log(RINKEBY_RPC_URL)
console.log(RINKEBY_PRIVATE_KEY)
console.log(Etherscan_API_KEY)

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  defaultNetowrk: "hardhat",
  networks: {
    rinkeby: {
      url: RINKEBY_RPC_URL,
      accounts: [RINKEBY_PRIVATE_KEY],
      chainId: 4,
    },
  },
  solidity: "0.8.9",
  etherscan: {
    // Your API key for Etherscan
    // Obtain one at https://etherscan.io/
    apiKey: Etherscan_API_KEY,
  },
};
