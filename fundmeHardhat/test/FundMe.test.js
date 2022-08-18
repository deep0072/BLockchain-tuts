const { ethers, getNamedAccounts, deployments } = require("hardhat");
const { expect, assert } = require("chai");

describe("Fundme", async () => {
  let deployer;
  let fundme;
  let mockV3Aggregator;
  const sendValue = ethers.utils.parseEther("1"); // ethvalue derived from a digit followed by 18 zeros
  beforeEach(async () => {
    deployer = (await getNamedAccounts()).deployer; // get account eg. rinkeby, or hardhat local

    await deployments.fixture(["all"]); // fixture method deploy the contract that is avialable in deploy folder
    // here "all" is the tag that is mentioned in deploy folder

    fundme = await ethers.getContract("Fundme", deployer); // get most recent deplyed contract

    // here deployer is the account

    mockV3Aggregator = await ethers.getContract("MockV3Aggregator", deployer);
  });

  // checking price feed address are equal or not
  describe("constructor", async () => {
    it("set the Agreegator price feed address", async function () {
      const response = await fundme.priceFeed();

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

      const updatedEth = await fundme.addressToAmountFunded(deployer);
      assert.equal(updatedEth.toString(), sendValue.toString());
    });

    it("add funder to array if funders", async function () {
      await fundme.fund({ value: sendValue });
      const response = await fundme.funders(0);
      assert.equal(response, deployer); // checking funder is the caller of function
    });
  });

  describe("with draw fund checking", async function () {
    // withdraw amount so first we need to add some fund into the wallet
    beforeEach("adding some fund", async function () {
      await fundme.fund({ value: sendValue });
    });
    // there are follwing step
    // first get balance wrt to their account address
    it("now with draw fund", async function () {
      const startingFundmeBalance = await fundme.provider.getBalance(
        // getBalance is method  used to get balance of any contract
        fundme.address
        // check fund me balance
      );

      const startingDeployerBalance = await fundme.provider.getBalance(
        deployer
      ); // owner balance who is going to withdraw from fund me

      //now run withdraw function
      const transResponse = await fundme.withdraw();
      const transReciept = await transResponse.wait(1); //wait for block confirmation
      const { gasUsed, effectiveGasPrice } = transReciept;
      const gasCost = gasUsed.mul(effectiveGasPrice); // deduce the gas fee

      const endingFundmeBalance = await fundme.provider.getBalance(
        // its output is big number type
        fundme.address
      ); // check contract balance after withdrawl
      const endingDeployerBalance = await fundme.provider.getBalance(deployer); // check owner balanee who withdraw the fund

      // now check total balance is zero
      assert.equal(endingFundmeBalance, 0); // it indicates we have withdrawn all money

      // check owner balance that he is recieved or not we add gas cost to deployer balance (owner balance) because owner will spend some gas here after withdrawl
      assert.equal(
        startingFundmeBalance.add(startingDeployerBalance).toString(),
        endingDeployerBalance.add(gasCost).toString()
      );
    });

    it("allows us to withdraw from multiple funders", async function () {
      const accounts = await ethers.getSigners();

      for (let i = 1; i < 6; i++) {
        const fundmeConnectedContract = await fundme.connect(accounts[i]); // now connect  each acoount to fundme smartcontract
        await fundmeConnectedContract.fund({ value: sendValue });
      }

      const startingFundmeBalance = await fundme.provider.getBalance(
        fundme.address
      );

      const startingDeployerBalance = await fundme.provider.getBalance(
        deployer
      );
      console.log("withdrawing fund..................");
      const transactionResponse = await fundme.withdraw();
      const transactionReceipt = await transactionResponse.wait(1);
      const endingFundmeBalance = await fundme.provider.getBalance(
        fundme.address
      );
      const endingDeployerBalance = await fundme.provider.getBalance(deployer);

      const { gasUsed, effectiveGasPrice } = transactionReceipt;
      const gasCost = gasUsed.mul(effectiveGasPrice);
      assert.equal(endingFundmeBalance, 0);

      assert.equal(
        startingFundmeBalance.add(startingDeployerBalance).toString(),
        endingDeployerBalance.add(gasCost).toString()
      );

      // make sure funders are reset properly
      await expect(fundme.funders(0)).to.be.reverted;

      for (i = 1; i < 6; i++) {
        assert.equal(
          await fundme.addressToAmountFunded(accounts[i].address),
          0
        );
      }
    });
  });
});
