pragma solidity >=0.7.5 <=0.9.5;

contract TestCotract {
    // call other contract as n param in function then via dot notation we can use its function
    function setX(testContract _test, uint256 x) external {
        _test.setX(x);
    }
}

contract testContract {
    uint256 public x;

    function setX(uint256 _x) external {
        x = _x;
    }
}
