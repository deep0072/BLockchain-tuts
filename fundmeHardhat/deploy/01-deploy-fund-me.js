const { network } = require("hardhat");
const { networkConfig } = require("../helper-hardhat-config");
module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy, log } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = network.config.chainId;

  const ehtUsdPriceFeed = networkConfig[chainId]["ethUsdPriceFeed"]; // get the address pricefeed of different blockchainbased in chainId stored in helper-hardhat-config

  // if contract doesnot exist then we deploy minimal version of it for our local

  const Fundme = await deploy("fundme", {
    from: deployer,
    args: [ehtUsdPriceFeed], // this is the address for the price feed . which will gives use the usd price of token on diffenrent chain
    logs: true,
  });
};
