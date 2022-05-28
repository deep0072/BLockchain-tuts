pragma solidity >= 0.7.5 <0.9;

contract Mycontract {

    // function return mulitple output 
    function multiOUtput() public pure returns(uint , uint){
        return (1,2); // output ==>>     uint256: 1 uint256:2
 
    
    }




    // to name the output 
    function multiOUtputName() public pure returns(uint x, uint y){
        return (1,2);  // output of this function ==>      uint256: x 1  uint256: y 2
    }

   



      // to retrun output we dont need to use return keyword it also save your gas little bit 
    function assigned() public pure returns(uint x, uint y){
        x = 1;
        y =2;
    }

    
}
    