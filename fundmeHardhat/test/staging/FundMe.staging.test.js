const { ethers, getNamedAccounts, deployments, network } = require("hardhat");
const { assert, expect } = require("chai");
const { developmentChains } = require("../../helper-hardhat-config");
console.log(developmentChains);
developmentChains.includes(network.name) // it means staging test only done on testnets
  ? describe.skip
  : describe("Fundme", async function () {
      console.log(`tage testing.............${network.name}`);
      let deployer;
      let fundme;
      const sendValue = ethers.utils.parseEther("0.001");
      beforeEach(async function () {
        deployer = (await getNamedAccounts()).deployer;
        console.log(deployer, "deployer");
        fundme = await ethers.getContract("Fundme", deployer);
      });

      it("allow people to withdraw fund", async function () {
        await fundme.fund({ value: sendValue });
        const response = await fundme.withdraw();
        await response.wait(1);

        const endingBalance = await fundme.provider.getBalance(fundme.address);

        assert.equal(endingBalance.toString(), "0");
      });
    });

// this script will run only by ==>  yarn hardhat test --network rinkeby
