pragma solidity ^0.8.5;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./priceConverter.sol";

error Fundme_NotOwner();

contract Fundme {
    using priceConvert for uint256;
    address[] public funders;
    uint256 public constant MINIMUM_USD = 20 * 1e18;
    mapping(address => uint256) public addressToamountFunded;
    address owner;
    AggregatorV3Interface public priceFeed;
    event funded(address sender, uint256 msg);
    modifier checkOwner() {
        if (msg.sender != owner) revert Fundme_NotOwner();
        _;
    }

    constructor(address priceFeedAddress) {
        owner = msg.sender;
        priceFeed = AggregatorV3Interface(priceFeedAddress);
    }

    receive() external payable {
        fund();
    }

    function fund() public payable {
        require(
            // here msg.value is first param that is defined in getConversion() function and 2nd param will be passed in paranthesis of this function
            msg.value.getConversion(priceFeed) >= MINIMUM_USD,
            "not sufficient amount please check also"
        );

        funders.push(msg.sender);
        addressToamountFunded[msg.sender] += msg.value;
        emit funded(msg.sender, msg.value);
    }

    function withdraw() public checkOwner {
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex = funderIndex++
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
}
