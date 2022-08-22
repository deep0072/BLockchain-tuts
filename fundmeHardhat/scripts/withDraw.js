const { assert } = require("chai");
const { getNamedAccounts, ethers } = require("hardhat");

async function main() {
  const deployer = (await getNamedAccounts()).deployer;
  const fundme = await ethers.getContract("Fundme", deployer);
  console.log(await fundme.provider.getBalance(fundme.address));
  console.log(deployer, "deployer");
  const transResponse = await fundme.withdraw();
  await transResponse.wait(1);
  console.log("fund withdraw..............");
  assert.equal(
    (await fundme.provider.getBalance(fundme.address)).toString(),
    "0"
  );

  console.log(await fundme.provider.getBalance(fundme.address));
}
main()
  .then(() => process.exit(0))
  .catch((e) => {
    console.log(e);
    process.exit(1);
  });
