pragma solidity >=0.7.5 <0.9;

contract Myconstructor{
    address public owner;

    constructor () {
        owner= msg.sender; //initialised owner
    }

    modifier Ownable { // create modifier to check the  owner
        require(msg.sender == owner, "not the owner");
        _;
    }

    function setNew(address newOwner) external Ownable{ // set the new owner that is only callableby owner
        require(newOwner!= address(0), "not a valid address");

        owner = newOwner;
    }

    function onlyOwnercall () external Ownable{

    }

    function anyoneCall() external { //function that is called by anyone because we did not use any modifier in it

    }
}