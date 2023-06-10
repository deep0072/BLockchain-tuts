//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import "./simpleStorage.sol"; // import whole file
import {SimpleStorage} from "./simpleStorage.sol"; // import specific contract

contract StorageFactory {
    // intializing the contract type variable here
    SimpleStorage public myListOfSimpleStorage;

    function createSimpleStorageContract() public {
        SimpleStorage mySimpleStorage = new SimpleStorage(); // here we are trying to deploy contract here
        myListOfSimpleStorage.push(mySimpleStorage);
    }
}
