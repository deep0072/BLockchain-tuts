// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "priceConverter.sol";

contract FundMe {
    using PriceConverter for uint256; // importing library
    uint256 public constant MIN_AMOUNT = 5e18; // minimum amount in usd is 15 dollar;

    mapping(address funders => uint256 amountToFunded)
        public addressToAmountFunded;
    address[] public funders;
    address immutable i_owner;

    constructor(address _owner) {
        i_owner = _owner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not the owner");
        _;
    }

    function fund() public payable {
        require(msg.value.getConversionRate < MIN_AMOUNT, "not enough eth");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] =
            addressToAmountFunded[msg.sender] +
            msg.value;
    }

    function withdraw() public onlyOwner {
        require(address(this).balance > 0, "not enought eth");
        for (
            uint256 functionIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];

            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);

        (bool success, ) = payable(i_owner).call{value: addres(this).balance}(
            ""
        );

        require(success, "transactions failed");
    }
}
