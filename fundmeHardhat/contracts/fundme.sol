pragma solidity ^0.8.5;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./priceConverter.sol";

contract Fundme {
    event funded(address sender, uint msg);
    using priceConvert for uint256;
    uint256 public constant MINIMUM_USD = 20 * 1e18;
    address[] public funders;
    mapping(address => uint256) public addressToamountFunded;
    address owner;
    AggregatorV3Interface public priceFeed;

    constructor(address priceFeedAddress) {
        owner = msg.sender;
        priceFeed = AggregatorV3Interface(priceFeedAddress);
    }

    function fund() public payable {
        require(
            // here msg.value is first param that is defined in getConversion() function and 2nd param will be passed in paranthesis of this function
            msg.value.getConversion(priceFeed) >= MINIMUM_USD,
            "not sufficient amount"
        );

        funders.push(msg.sender);
        addressToamountFunded[msg.sender] = msg.value;
        emit funded(msg.sender, msg.value);
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

    // if someone send ether to this address then fund function will call automatically by recieve

    receive() external payable {
        fund();
    }
}
