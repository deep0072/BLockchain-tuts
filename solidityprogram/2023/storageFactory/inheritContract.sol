// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import "./simpleStorage.sol";

contract AddFive is SimpleStorage {
    function setFavoriteNumber(uint256 _number) public override {
        myFavoriteNumber = _number + 5;
    }
}
