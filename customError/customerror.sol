pragma solidity ^0.8.7;

contract Cutomerror {
    // syntaxt for custom error ==> error erronName()
    error Notowner();
    address owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert Notowner(); // here revering if msg.sender is not original
        }
    }

    function checkBalance() public view onlyOwner returns (uint256) {
        return address(this).balance;
    }
}
