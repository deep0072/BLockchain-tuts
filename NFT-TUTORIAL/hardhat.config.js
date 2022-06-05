require("@nomiclabs/hardhat-waffle");
require("dotenv").config();

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",
  networks: {
    rinkeby: {
      url: process.env.ALCHEMY_API_URL_KEY,
      accounts: [rocess.env.PRIVATE_KEY]
    }

  }

  // how we define which test network use to deploy  to



  // how do we define which account to use for deployment
};
