pragma solidity ^0.8.5;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./priceConvert.sol";

contract Fundme {
    using priceConvert for uint256;
    uint256 public constant MINIMUM_USD = 20 * 1e18;
    address[] public funders;
    mapping(address => uint256) public addressToamountFunded;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        require(
            msg.value.getConversion() >= MINIMUM_USD,
            "not sufficient amount"
        );
        funders.push(msg.sender);
        addressToamountFunded[msg.sender] = msg.value;
    }

    modifier checkOwner() {
        require(msg.sender == owner, "not authorised");
        _;
    }

    function withdraw() public checkOwner {
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            addressToamountFunded[funders[funderIndex]] = 0;

            funders = new address[](0);

            // send ether

            (bool status, ) = payable(msg.sender).call{
                value: address(this).balance
            }("");

            require(status, "transaction failed");
        }
    }


    // if someone send ether to this address then fund function will call automatically
    

    receive () external payable {
        fund();
    }
}
