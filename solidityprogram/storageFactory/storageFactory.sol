pragma solidity >=0.7.8 <=0.9.5;

import "./simpleStorage.sol";

contract storageFactory {
    simpleStorage[] simpleStorageArray;

    function createSimpleStorage() public {
        simpleStorage _simpleStorage = new simpleStorage();
        simpleStorageArray.push(_simpleStorage);
    }

    /*

        GET THE ADDRESS OF  DEPLOYED SMARTCONTRACT FROM AN ARRAY VIA INDEX
        AND THEN CALL THE FUNCTION FROM ADDRESS
    
    
     */
    function sfStore(uint256 storageIndex, uint256 storeNumber) public {
        // get the address that is deployed from an array
        simpleStorage _simpleStorage = simpleStorageArray[storageIndex];

        // here .store() is function of simplestorage
        _simpleStorage.store(storeNumber);
    }

    // fetch the retreive function from deployed contract

    function sfGet(uint256 _storageIndex) public view returns (uint256) {
        simpleStorage _simpleStorage = simpleStorageArray[_storageIndex];
        return _simpleStorage.retreive();
    }
}
