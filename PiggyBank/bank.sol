pragma solidity >=0.7.5 <=0.8.8;

/*
 piggy bank is smart contract which has some feature

 1. anyone can send this contract an ether
 2. only owner can withdraw the ether from it 
 3. after withdrawing destory this piggy contract




 */

contract piggyBank {
    event Deposit(uint256 amount);
    event withDraw(uint256 amount);

    // set the deployer of this contract to the owner
    address public owner = msg.sender;

    // recieve eth
    receive() external payable {
        emit Deposit(msg.value);
    }

    // withdraw and destroy it. only owner can use this

    function WithDraw() external {
        require(owner == msg.sender, " you are not owner");

        emit withDraw(address(this).balance);

        selfdestruct(payable(msg.sender));
    }
}
