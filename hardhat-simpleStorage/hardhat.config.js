require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const RINKEBY_RPC_URL = process.env.RINKEBY_RPC_URL;
const RINKEBY_PRIVATE_KEY = process.env.private_key;

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
};
