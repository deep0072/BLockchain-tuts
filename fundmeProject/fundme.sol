pragma solidity ^0.8.5;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./priceConvert.sol";

contract Fundme {
    using priceConvert for uint256;
    uint256 public minimumUsd = 20 * 1e18;
    address[] public funders;
    mapping(address => uint256) public addressToamountFunded;

    function fund() public payable {
        require(
            msg.value.getConversion() >= minimumUsd,
            "not sufficient amount"
        );
        funders.push(msg.sender);
        addressToamountFunded[msg.sender] = msg.value;
    }
}
