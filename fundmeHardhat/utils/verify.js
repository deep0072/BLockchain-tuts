const {run} = require("hardhat")
const verify = async function verify(conractAddress, args) {
    console.log("deploying");
  
    // to check the deployed contract is verified or not
    // also to handle the error during publications
    try {
      await run("verify:verify", {
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

module.exports = {verify}