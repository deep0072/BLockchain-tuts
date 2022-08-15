const { ethers, run, network } = require("hardhat");
const { verify } = require("../utils/verify");
const {
  networkConfig,
  developmentChains,
} = require("../helper-hardhat-config");
module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy, log, get } = deployments;
  const { deployer, user } = await getNamedAccounts();
  const chainId = network.config.chainId;
  console.log(chainId, "chainId");

  // if contract doesnot exist then we deploy minimal version of it for our local
  let ethUsdPriceFeedAddress; // intialise the var for priceFeed

  if (developmentChains.includes(network.name)) {
    console.log("local network..");
    const ethUsdAggregator = await deployments.get("MockV3Aggregator"); // get deployed contract address
    ethUsdPriceFeedAddress = ethUsdAggregator.address; // that give the ethUsdPriceFeedAddress
  } else {
    console.log(network.name, chainId);

    ethUsdPriceFeedAddress = networkConfig[chainId]["ethUsdPriceFeedAddress"]; // get the address pricefeed of different blockchainbased in chainId stored in helper-hardhat-config
  }
  const args = [ethUsdPriceFeedAddress];
  const fundme = await deploy("Fundme", {
    from: deployer, // fetch the index of pvt key mentioned in accounts in hardhat.config.js
    args: args, // this is the address for the price feed . which will gives use the usd price of token on diffenrent chain
    logs: true,
    waitConfirmations: network.config.blockConfirmations || 2,
  });
  log("fund me deployed");

  log("-------------------------------------------------------------");

  if (
    !developmentChains.includes(network.name) &&
    process.env.Etherscan_API_KEY
  ) {
    console.log(fundme.address, "address");
    await verify(fundme.address, args);
  }
};

module.exports.tags = ["all", "Fundme"];
