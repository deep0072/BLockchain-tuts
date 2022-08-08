const { networks } = require("../hardhat.config")



module.exports = async (hre)=>{
    const {getNamedAccounts,deployments} = hre
    const {deploy, log} = deployments
    const {deployer} = await getNamedAccounts()
    const chainId = networks.config.chainId
}