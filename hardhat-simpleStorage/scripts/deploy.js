// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const { ethers, run } = require("hardhat");

async function main() {
  const simpleStorage = await ethers.getContractFactory("SimpleStorage");
  const SimpleStorageDeploy = await simpleStorage.deploy();
  await SimpleStorageDeploy.deployed();
  console.log(`deployed contract to ${SimpleStorageDeploy.address}`);
}

// verify deployed contract
async function verify(conractAddress, args) {
  console.log("deploying");

  // to check the deployed contract is verified or not
  // also to handle the error during publications
  try {
    await run("verify: verify", {
      address: conractAddress,
      constructorArguments: args,
    });
  } catch (e) {
    if (e.message.toLowerCase().includes("already verified")) {
      console.log("verified ");
    } else {
      console.log(e);
    }
  }
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
