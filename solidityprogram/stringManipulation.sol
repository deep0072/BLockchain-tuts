pragma solidity >=0.7.5 <=0.9.5;

// concatenate the sting using abi.encodePacked(String1. str2)
contract A {
    function getUint(string memory name, string memory lastname)
        public
        pure
        virtual
        returns (string memory)
    {
        return string(abi.encodePacked(name, lastname));
    }
}

/* get string length  by casting string to bytes 
and then calculate the length
*/

contract A {
    function getUint(string memory name) public pure virtual returns (uint256) {
        bytes memory byteStr = bytes(name);
        return byteStr.length;
    }
}
