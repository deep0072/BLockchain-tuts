const {ethers} = require("hardhat")
const {expect,assert} = require("chai")


// describe is keyword that will take two params

describe("SimpleStorage", ()=>{
    let simpleStorageFactory, simpleStorage

    // before each is inbuilt function that is deploying our contract for testing
    beforeEach(async function (){ // here we are deploying smartcontract for testing purpose
        simpleStorageFactory = await ethers.getContractFactory("SimpleStorage")
        simpleStorage = await simpleStorageFactory.deploy()
    })


    // it keyword used to test each function that is available in deployed contract
    it('should start with 0', async function(){
        const currentValue = await simpleStorage.retreive()
        const expectedValue = "0"

        assert.equal(currentValue.toString(), expectedValue)

    })
    it("should equal to expected value", async function (){
        const expectedValue = "890"
        const transactionResponse = await simpleStorage.store(expectedValue)
        await transactionResponse.wait(1)
        const updatedValue = await simpleStorage.retreive()
        assert.equal(updatedValue.toString(), expectedValue)
    })
})