// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "priceConverter.sol";
contract FundMe {

    using PriceConverter for uint256; // importing library
    uint256 public minAmount = 5e18; // minimum amount in usd is 15 dollar;

    mapping(address funders => uint256 amountToFunded) public addressToAmountFunded;
    address[] public funders;
    function fund() public payable {
        require( msg.value.getConversionRate < minAmount, "not enough eth");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
        
    }

    function withdraw() public {}

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419)
            .version();
    }


    function getPrice() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);

        (, int256 price, ,,) = priceFeed.latestRoundData();

        return uint256(price)*1e10; // price of eth in usd followed by 10 zeross
    }

    function getConversionRate(uint256 amountOfEth) public view returns(uint256){

        // its like 1eth = 1followed by 18 zeros in wei
        // eth prices = price followed by 18 digit
        // eth * eth price = amount followed by 36 digit
        // thats why we divide it 1 raise to power 18
        uint256 ethPriceInUsd = getPrice(); // let say current price 1726 followedby 10 zeros

        uint256 amountOfEthInUsd = (ethPriceInUsd * amountOfEth) / 1e18;

        return amountOfEthInUsd
    }


}
