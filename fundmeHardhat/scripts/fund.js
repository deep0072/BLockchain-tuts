const { getNamedAccounts, ethers } = require("hardhat");

async function main() {
  const deployer = (await getNamedAccounts()).deployer; // get the address through which we want to deploy the contract
  const fundme = await ethers.getContract("Fundme", deployer); // grab the contract
  console.log("funding contract ....");
  console.log(deployer);
  const transactionResponse = await fundme.fund({
    value: ethers.utils.parseEther("1"),
  });
  await transactionResponse.wait(1);
  console.log("funded");
}
main()
  .then(() => {
    process.exit(0);
  })
  .catch((e) => {
    console.log(e);
    process.exit(1);
  });
