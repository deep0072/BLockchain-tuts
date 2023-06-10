//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import "./simpleStorage.sol"; // import whole file
import {SimpleStorage} from "./simpleStorage.sol"; // import specific contract

contract StorageFactory {
    // intializing the contract type variable here
    SimpleStorage[] public myListOfSimpleStorage;

    function createSimpleStorageContract() public {
        SimpleStorage mySimpleStorage = new SimpleStorage(); // here we are trying to deploy contract here
        myListOfSimpleStorage.push(mySimpleStorage);
    }

    function sfStore(
        uint256 _indexSimplestorage,
        uint256 _simpleStorageNumber
    ) public {
        // get deployed contract address

        // then  use deployed contract function to set new number
        myListOfSimpleStorage[_indexSimplestorage].setFavoriteNumber(
            _simpleStorageNumber
        );
    }

    // get favnumber from selected
    function retreiveNumber(
        uint256 _simpleStorageIndex
    ) public view returns (uint256) {
        return myListOfSimpleStorage[_simpleStorageIndex].getMyFavNumber();
    }
}
