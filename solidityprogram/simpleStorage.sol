// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract simpleStorage {
    // default intialization of any var is set to
    //internal type
    // uint256   favoriteNumber

    uint256 public favoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    //function to read state var

    function retreive() public view returns (uint256) {
        return favoriteNumber;
    }
}
