// this will deploy the MockV3Aggregator.sol
const { network } = require("hardhat");
const { SOLIDITY_FILES_CACHE_FILENAME } = require("hardhat/internal/constants");
const {
  developmentChains,
  DECIMAL,
  INITIAL_ANSWER,
} = require("../helper-hardhat-config");

module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy, log } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = network.config.chainId;

  if (developmentChains.includes(network.name)) {
    log("local network detected !! Deploying mocks....");

    await deploy("MockV3Aggregator", {
      contract: "MockV3Aggregator",
      from: deployer,
      log: true,
      args: [DECIMAL, INITIAL_ANSWER],
    });

    log("Mocks deployed....");
    log("----------------------------------");
  }
};

module.exports.tags = ["all", "mocks"]; // it is used to run in terminal "yarn hardhat deploy --tags mocks"
