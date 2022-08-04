const { task } = require("hardhat/config");

// hre in params is HardhatRunTmeEnvironment variable that contains same packages as hardhat
task("block-number", "get block number").setAction(async (taskArgs, hre) => {
  const blockNumber = await hre.ethers.provider.getBlockNumber();
  console.log(`current blocknumebr is ${blockNumber}`);
});
