pragma solidity ^0.8.5;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./priceConverter.sol";
import "hardhat/console.sol";

error Fundme__NotOwner();

contract Fundme {
    using priceConvert for uint256;
    address[] public s_funders;
    uint256 public constant MINIMUM_USD = 20 * 1e18;
    mapping(address => uint256) public s_addressToAmountFunded;
    address public immutable i_owner;
    AggregatorV3Interface public s_priceFeed;
    event funded(address sender, uint256 msg);
    modifier checkOwner() {
        if (msg.sender != i_owner) revert Fundme__NotOwner();
        _;
    }

    constructor(address priceFeedAddress) {
        i_owner = msg.sender;
        s_priceFeed = AggregatorV3Interface(priceFeedAddress);
    }

    receive() external payable {
        // if someone send ether to this address then fund function will call automatically by recieve
        fund();
    }

    function fund() public payable {
        require(
            // here msg.value is first param that is defined in getConversion() function and 2nd param will be passed in paranthesis of this function
            msg.value.getConversion(s_priceFeed) >= MINIMUM_USD,
            "not sufficient amount please check also"
        );

        s_funders.push(msg.sender);
        s_addressToAmountFunded[msg.sender] += msg.value;
        emit funded(msg.sender, msg.value);
    }

    function withdraw() public payable checkOwner {
        for (
            uint256 funderIndex = 0;
            funderIndex < s_funders.length;
            funderIndex++
        ) {
            s_addressToAmountFunded[s_funders[funderIndex]] = 0;

            // send ether
        }

        s_funders = new address[](0);

        (bool status, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");

        require(status, "transaction failed");
    }

    // declare cheaper withDraw function that cost lesser  gas fee

    function cheaperWithdraw() public payable checkOwner {
        // load funders  in to memory so that we can access it without using more gas fee in for loop

        address[] memory funders = s_funders;

        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            s_addressToAmountFunded[funders[funderIndex]] = 0;
        }

        s_funders = new address[](0);

        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");

        require(success, "transfer is failed");
    }
}
