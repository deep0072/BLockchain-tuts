pragma solidity >=0.7.5 <0.9;

contract Myconstructor{
    uint public x;
    address public addr;
    constructor (uint _x){
        addr = msg.sender;
        x = _x;
    }
}