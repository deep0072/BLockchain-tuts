pragma solidity  >=0.7.0 <0.9.0;

contract Modifier {
    uint public x;

    bool public paused;

    function setPaused(bool _paused) external {
        paused = _paused;
    }

    modifier whenNotpaused {
        require(!paused, "paused");
        _;
    }

    function inc() external whenNotpaused {
        
        x+=1;
    }

    function dec() external whenNotpaused{
        

        x-=1;

    }

    // as baove given both uses require 2 times. so te remove this redundancy we use modifier



} 