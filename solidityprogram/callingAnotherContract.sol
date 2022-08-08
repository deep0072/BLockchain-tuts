pragma solidity ^0.8.7;

contract Callee {
    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }

    function incValue(uint _value) external {
        value += _value;
    }
}

contract Caller {
    function getOtherSetX(address _callee, uint x) external {
        // here _Callee is the address of Callee which function we want to call
        // we can write Callee _callee ==> Contract name contract address
        Callee(_callee).setX(x);
    }

    function incOtherIncValue(address _calle, uint _value) external {
        Callee(_calle).incValue(_value);
    }
}
