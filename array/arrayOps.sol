pragma solidity >=0.7.5 <0.9;

contract arrayContract {
    uint [] public arr; // dynamic array

    uint [4] public fixedArr; // can store upto 4 elements

    // intialise the array
    uint [] public num = [45,67,23,6,45];

    uint [4] public num2 = [56,34,5,23]; // with fixed lenght

    function example() external {
        num.push(50); // adding element in num array nums = [45,67,23,6,45,50]
        num[5]; //get element at the 5 th index.  output = 50

        delete num [2]; // delete element at index 2  but it will set there 0 element by defualt nums = [45,67,0,6,45,50]

        num.pop(); // removed last element nums = [45,67,23,6,45]

        //get size of array
        num.length; // 5

        // create an array in memory
        uint[] memory a = new uint[](5);
        // push and pop wont work in as array is fixed size


    }


    // returning array in function 
    function returnArray() external view returns (uint[] memory){
        return num;

    }

   


}