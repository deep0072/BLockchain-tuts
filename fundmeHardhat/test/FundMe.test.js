const { ethers, getNamedAccounts, deployments } = require("hardhat");
const { expect, assert } = require("chai");


  describe("Fundme", async () => {
    let deployer;
    let fundme;
    let mockV3Aggregator;
    const sendValue = ethers.utils.parseEther("1"); // ethvalue
    beforeEach(async () => {
      deployer = (await getNamedAccounts()).deployer; // get account eg. rinkeby, or hardhat local
      console.log(
        deployer.address,
        "deployerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"
      );

      await deployments.fixture(["all"]); // fixture method deploy the contract that is avialable in deploy folder
      // here "all" is the tag that is mentioned in deploy folder

      fundme = await ethers.getContract("Fundme", deployer); // get most recent deplyed contract
      console.log(fundme, "fundme");
      // here deployer is the account
      console.log("deploying contract...........");
      mockV3Aggregator = await ethers.getContract("MockV3Aggregator", deployer);
    });

    // checking price feed address are equal or not
    describe("constructor", async () => {
      it("set the Agreegator price feed address", async function () {
        const response = await fundme.priceFeed();
        console.log(response, "response");
        assert.equal(response, mockV3Aggregator.address);
      });
    });

    // sending fund also checking failing when we send empty fund

    describe("fund", async () => {
      it("checking fund are working or fails", async () => {
        await expect(fundme.fund()).to.be.revertedWith(
          "not sufficient amount please check also"
        ); // here we are checking if there is no fund then test should not break the code.
      });

      it("updated amount of eth", async function () {
        await fundme.fund({ value: sendValue });
        console.log(deployer, "my deployer address");
        const updatedEth = await fundme.addressToamountFunded(deployer);
        assert.equal(updatedEth.toString(), sendValue.toString());
      });


      it("add funder to array if funders", async function(){
        await fundme.fund({value:sendValue})
        const response = await fundme.funders(0)
        assert.equal(response, deployer) // checking funder is the caller of function

      })
    });


  });
