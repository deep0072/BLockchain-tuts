pragma solidity >=0.7.0 <0.9.0;

contract Mycontract {
    uint256 public x;

    function increMent() external {
        x += 1;
    }

    function decreMent() external {
        x -= 1;
    }
}
