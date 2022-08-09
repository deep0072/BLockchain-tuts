const { network } = require("hardhat");
const {
  networkConfig,
  developmentChains,
} = require("../helper-hardhat-config");
module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy, log } = deployments;
  const { deployer, user } = await getNamedAccounts();
  const chainId = network.config.chainId;
  console.log(chainId, "chainId")


  // if contract doesnot exist then we deploy minimal version of it for our local
  let ethUsdPriceFeedAddress; // intialise the var for priceFeed

  if (developmentChains.includes(network.name)) {
    console.log("local network..")
    const ethUsdAggregator = await deployments.get("MockV3Aggregator"); // get deployed contract address
    ethUsdPriceFeedAddress = ethUsdAggregator.address;          // that give the ethUsdPriceFeedAddress
  } else {
    console.log(network.name, chainId)

    ethUsdPriceFeedAddress = networkConfig[chainId]["ethUsdPriceFeedAddress"]; // get the address pricefeed of different blockchainbased in chainId stored in helper-hardhat-config


  }

  const Fundme = await deploy("Fundme", {
    from: deployer, // fetch the index of pvt key mentioned in accounts in hardhat.config.js
    args: [ethUsdPriceFeedAddress], // this is the address for the price feed . which will gives use the usd price of token on diffenrent chain
    logs: true,
  });
  log("fund me deployed")
  log(deployer)

  log("-------------------------------------------------------------");
};

module.exports.tags = ["all", "Fundme"];
