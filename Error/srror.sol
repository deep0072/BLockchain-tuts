pragma solidity >=0.7.0 <0.9.0;

contract Error {
    function testRequire(uint x) public pure {

        require(x>=10, "x should be equal and greater than the 10");

    } 

    function testRevert(uint i) public pure {
        if (i >1){
            if (i >2){
                if (i >10){
                    revert("greater than 10");
                }
            }
        }
    }

    uint public x = 90;

    function  testAssert() public view {
        assert(x == 90);
    }
}