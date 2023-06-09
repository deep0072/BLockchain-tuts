// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract simpleStorage {
    // default intialization of any var is set to
    //internal type
    // uint256   favoriteNumber

    uint256 public myFavoriteNumber;

    // struct are used to create own variable
    struct Person {
        string name;
        uint256 favoriteNumber;
    }

    //create mapping
    mapping(string => uint) public nameTONumber;

    // Person public deep = Person({name: "Deepak", favoriteNumber: 90}); //{"0":"Deepak","1":"90","name":"Deepak","favoriteNumber":"90"}
    Person[] public listOfPerson; // []

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    //function to add people in list
    function addPeople(string memory _name, uint256 _favoriteNumber) public {
        listOfPerson.push(
            Person({name: _name, favoriteNumber: _favoriteNumber})
        );

        //add data into mapping
        nameTONumber[_name] = _favoriteNumber;
    }

    //function to read state var
    function retreive() public view returns (uint256) {
        return myFavoriteNumber;
    }
}
