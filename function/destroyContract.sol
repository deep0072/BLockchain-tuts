pragma solidity >=0.7.5 <=0.9.5;

contract Kill {
    // used to deposit eth when we deploy contract
    constructor() payable {}

    // function to kill the this contract
    function kill() external {
        /* self destruct is inbuilt fucntion that delete this contract and
        send its all eth to metion address in  self destruct function parameter
        though mentioned address uses fall back function or not
        */

        selfdestruct(payable(msg.sender));
    }

    // just to check that this fucntion  will work after contract deletion
    function getUint() external pure returns (uint256) {
        return 123;
    }
}

contract helperContract {
    // it will recieve eth even it is not using any fallback function
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // here we passing conract type _kill that will invoke kill function
    function destructContract(Kill _kill) external {
        _kill.kill();
    }
}
