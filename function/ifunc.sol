pragma solidity >=0.7.0 <0.9.0;

/*Name of the function is foo.
        It takes in  uint and returns an uint.
        It compares the value of x using if/else
*/

function foo(uint256 x) public returns (uint256) {
    if (x < 10) {
        return 0;
    } else if (x < 20) {
        return 1;
    } else {
        return 2;
    }
}
