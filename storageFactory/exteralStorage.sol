pragma solidity >=0.7.5 <=0.9.6;

import "./simpleStorage.sol";

contract ExternalStorage {
    // override the parent contract function

    // first add virtual keyword in parent function

    // then add override keyword in function that calling parent function

    function store(uint256 _favourite_num) public override {
        favouriteNumber = _favourite_num;
    }
}
