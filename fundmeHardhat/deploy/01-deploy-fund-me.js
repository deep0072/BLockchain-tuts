const { network } = require("hardhat");
const {
  networkConfig,
  developmentChains,
} = require("../helper-hardhat-config");
module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy, log } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = network.config.chainId;

  // if contract doesnot exist then we deploy minimal version of it for our local
  let ethUsdPriceFeedAddress; // intialise the var for priceFeed

  if (developmentChains.includes(network.name)) {
    const ethUsdAggregator = await deployments.get("MockV3Aggregator");
    ethUsdPriceFeedAddress = ethUsdAggregator.address;
  } else {
    ethUsdPriceFeedAddress = networkConfig[chainId]["ethUsdPriceFeedAddress"]; // get the address pricefeed of different blockchainbased in chainId stored in helper-hardhat-config
  }

  const Fundme = await deploy("Fundme", {
    from: deployer,
    args: [ethUsdPriceFeedAddress], // this is the address for the price feed . which will gives use the usd price of token on diffenrent chain
    logs: true,
  });

  log("-------------------------------------------------------------");
};

module.exports = ["all", "fundme"];
