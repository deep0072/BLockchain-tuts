// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    uint256 public myFavoriteNumber;

    struct People {
        string name;
        uint256 favoriteNumber;
    }

    People[] public listOfpeople;

    function setFavoriteNumber(uint256 _myFavoriteNumber) public virtual {
        myFavoriteNumber = _myFavoriteNumber;
    }

    //get myfavnumber
    function getMyFavNumber() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPeople(string memory _name, uint _favoriteNumber) public {
        listOfpeople.push(
            People({name: _name, favoriteNumber: _favoriteNumber})
        );
    }
}
