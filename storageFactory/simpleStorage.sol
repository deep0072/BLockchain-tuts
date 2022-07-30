pragma solidity ^0.8.7;

contract simpleStorage {
    struct People {
        string name;
        uint256 favouriteNumber;
    }

    uint256 public favouriteNumber;

    People[] public people;

    function store(uint256 _favouriteNumber) public virtual {
        favouriteNumber = _favouriteNumber;
    }

    function retreive() public view returns (uint256) {
        return favouriteNumber;
    }

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        People memory _people = People({
            name: _name,
            favouriteNumber: _favouriteNumber
        });

        people.push(_people);
    }
}
