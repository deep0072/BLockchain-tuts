pragma solidity >=0.7.5 <0.9;

contract arrayContract {

    uint[] public arr;
    uint public len = arr.length;

    

    function remove(uint x) public{
        for (uint i = x; i < arr.length-1; i++){
            arr[i] = arr[i+1];
             

        }

        arr.pop();

      
    }

    function test () external {
        arr = [98,56,47,3,7];
        remove(0);
        // arr = [
        assert(arr[0]==56);
        assert(arr[1]==47);
        assert(arr[2]==3);
        assert(arr[3]==7);
        assert(arr.length == 4);
      
    }
   


   


}