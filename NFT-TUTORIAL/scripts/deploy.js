// hardhat comes with built int ether.js


// import ethers from hardhat
const { ethers } = require("hardhat")


async function main() {
    // 1. tell the script we want to deploy the Nft
    const nft = ethers.getContractFactory("nftee")

    //2.Deploy it
    const deployedContract = await nft.deploy()

    // 3. print the address of the deployed contract
    console.log("deployed contract addresss", deployedContrac.address);

    // 4 now go to hardhat config.js to deploy on different test network 

}


main().then(() => process.exit(0)).catch((error) => {
    console.error(error);
    process.exit(1);
})