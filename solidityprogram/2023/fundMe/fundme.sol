// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error UnAuthorised();
error NotEnoughBalance();
error NotEnoughFund();
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
        if (msg.sender != owner) {
            revert UnAuthorised();
        }
        _;
    }

    function fund() public payable {
        if (msg.value.getConversionRate < MIN_AMOUNT) {
            revert NotEnoughFund();
        }

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] =
            addressToAmountFunded[msg.sender] +
            msg.value;
    }

    function withdraw() public onlyOwner {
        if (address(this).balance < 0) {
            revert NotEnoughEth();
        }

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

    // recieve and fallback function

    // if somebody send money accidently from metamsj  this contract then receive function  will  route to this fund fucntion
    // lets say user send 1 $ dollar to contract. but it is minimum 5 dollar. as recieve function route to fund function then it will
    // revert in that case

    receive() external payable {
        fund();
    }
}
