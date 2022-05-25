pragma solidity >=0.7.0 <0.9.0;

contract Mycontract {
    string public name = "Deepak"; // this is state variable declared outside the function

    function printName() external {
        string memory name2 = "puneet"; // this is local variable declared inside the function
    }
}
