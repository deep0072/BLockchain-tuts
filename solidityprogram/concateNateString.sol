pragma solidity >=0.7.5 <=0.9.5;

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
