pragma solidity >=0.7.5 <=0.9.5;

contract simpleStorage {
    struct People {
        string name;
        uint256 favouriteNumber;
    }

    uint256 public favouriteNumber;

    People[] public people;

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        People memory _people = People({
            name: _name,
            favouriteNumber: _favouriteNumber
        });

        people.push(_people);
    }
}