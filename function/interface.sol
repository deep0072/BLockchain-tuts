pragma solidity >=0.7.5 <=0.9.5;

// Icounter is external contract to which we are interfacing
interface ICounter {
    function count() external view returns (uint256);

    function Inc() external; // this is the function of Counter contract
}

contract getInterface {
    uint256 public count;

    function examples(address addr, uint256 _n) external {
        ICounter(addr).Inc(); // getting the inc method from Counter contract

        count = ICounter(addr).count(); // show the variable count that is incremented or decremented
    }
}
