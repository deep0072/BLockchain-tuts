const {ethers, getNamedAccounts,deployments} = require("hardhat");
const { expect, assert } = require("chai");
console.log("hmmmm"), 

describe("Fundme", async () => {
  let deployer;
  let fundme;
  let mockV3Aggregator;
  beforeEach(async () => {
    const { deploy, log } = deployments;
    deployer = (await getNamedAccounts()).deployer; // get account eg. rinkeby, or hardhat local
   
    await deployments.fixture(["all"]); // fixture method deploy the contract that is avialable in deploy folder
    // here "all" is the tag that is mentioned in deploy folder

    fundme = await ethers.getContract("Fundme", deployer); // get most recent deplyed contract
    console.log(fundme,"fundme")
    // here deployer is the account
    console.log("deploying contract...........")
    mockV3Aggregator = await ethers.getContract("MockV3Aggregator", deployer);
    console.log(mockV3Aggregator.address)
  });

  // checking price feed address are equal or not
  describe("constructor", async () => {
    it("set the Agreegator price feed address", async function () {
      const response = await fundme.priceFeed();
      console.log(response ,"response")
      assert.equal(response, mockV3Aggregator.address);
    });
  });

  // sending fund also checking failing when we send empty fund

  describe("fund", async () => {
    it("checking fund are working or fails", async () => {
      await fundme.fund();
    });
  });
});
