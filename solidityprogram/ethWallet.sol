pragma solidity >=0.7.5 <=0.9.5;

contract ethWallet {
    // first create state var that store owner of this contract
    // owner should be payable that can send eth

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    // create function to recieve the ether using receive function
    receive() external payable {}

    // create function to send ether
    function withDraw(uint256 _amount) external {
        // check caller of this function is owner
        require(msg.sender == owner, "not valid user");
        payable(msg.sender).transfer(_amount);

        // if i use owner then it will cost 30874 gas
        // if i use msg.sender then it will cost 30740 gas
    }

    // create function to get the balance of this contract
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
