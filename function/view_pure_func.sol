pragma solidity >=0.7.0 <0.9.0;

contract Mycontract {
    uint256 public x = 98;

    function Myadd(uint256 y) external view returns (uint256) {
        return x = x + y;
    }

    function Mysub(uint256 z, uint256 y) external pure returns (uint256) {
        return z + y;
    }

    // invalid view function
    // function Myadd(uint256 y) external view returns (uint256) {
    //     return x += y;

    //     // x already declared and we are trying to modifying the current x so it is invalid
    // }

    // // invalid pure function
    // function Myadd(uint256 y) external pure returns (uint256) {
    //     return x + y;

    //     // this is invalid because pure function cant access the already declare variable

    // }
}
