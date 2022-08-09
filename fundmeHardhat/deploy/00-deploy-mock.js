const {developmentChains,DECIMAL, INITIAL_ANSWER }= require("../helper-hardhat-config")
const {network}= require("hardhat")

module.exports  = async({getNamedAccounts, deployments})=>{
    const {deploy,log} = deployments
    const{deployer} = await getNamedAccounts()

    if (developmentChains.includes(network.name)){
        await deploy("MockV3Aggregator",{
            contract: "MockV3Aggregator",
            from:deployer,
            log:true,
            args:[DECIMAL,INITIAL_ANSWER]
        })
        log("Mocks deployed lfghofhgofhg......")
        log("--------------------")
    }

};
module.exports.tags = ["all", "mocks"]
