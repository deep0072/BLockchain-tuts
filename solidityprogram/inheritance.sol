pragma solidity >=0.7.0 <0.9.0;

// inheritance
contract A {
    function name() public pure virtual returns (string memory) {
        return "Deepak";
    }

    function lastName() public pure virtual returns (string memory) {
        return "Kumar";
    }

    function fullname() public pure virtual returns (string memory) {
        return "deepak kumar";
    }
}

contract B is A {
    function name() public pure override returns (string memory) {
        return "david";
    }

    function lastName() public pure override returns (string memory) {
        return "malhotra";
    }
}
