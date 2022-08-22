pragma solidity ^0.8.5;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./priceConverter.sol";
import "hardhat/console.sol";

error Fundme__NotOwner();

contract Fundme {
    using priceConvert for uint256;
    address[] private s_funders;
    uint256 public constant MINIMUM_USD = 0.0001 * 1e18;
    mapping(address => uint256) private s_addressToAmountFunded;
    address private immutable i_owner;
    AggregatorV3Interface private s_priceFeed;
    event funded(address sender, uint256 msg);
    modifier checkOwner() {
        // require(msg.sender == i_owner, "not the owner");
        if (msg.sender != i_owner) {
            revert Fundme__NotOwner();
        }
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
            "not sufficient amount please check also payments"
        );

        s_funders.push(msg.sender);
        s_addressToAmountFunded[msg.sender] += msg.value;
        emit funded(msg.sender, msg.value);
    }

    function withdraw() public checkOwner {
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

    function cheaperWithdraw() public checkOwner {
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

    function getOwner() public view returns (address) {
        return i_owner;
    }

    function getFunders(uint256 index) public view returns (address) {
        return s_funders[index];
    }

    function getaddressToAmountFunded(address funder)
        public
        view
        returns (uint256)
    {
        return s_addressToAmountFunded[funder];
    }

    function getPriceFeed() public view returns (AggregatorV3Interface) {
        return s_priceFeed;
    }
}
