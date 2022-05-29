pragma solidity >=0.7.5 <0.9;

contract myStruct{

    struct CAR {
        string model;
        uint year;
        address owner;

    }

    CAR public car;
    CAR[] public cars; // list of cars

    mapping(address=>CAR[]) public carsByowner;


    function examples() external {
        // initialization of structs

      
        CAR memory tesla;
        tesla.model= "model s";
        tesla.year = 2012;
        tesla.owner = msg.sender;

        cars.push(suzuki); // we are addding data into  car list that is struct type
        cars.push(Hundai);
        cars.push(tesla);


        // as cars is state variable so we need to change its info like year so to do it we use storage 

        CAR storage _car = cars[0]; // get the first struct info. storage keyword used for statevariable

        _car.model = "Ritz";
        
        // if i want to rest the owner of car then just delete the value of that key

        delete _car.owner; // it will set car.owner = 0x000000000000000000




        // cars at  0 th index's output will be 
        
            
        // string: model Ritz
        // 1:
        // uint256: year 2006
        // 2:
        // address: owner 0x0000000000000000000000000000000000000000


    }

}

struct Company {
    string name;
    string revenue
}


mapping(address=>Company) public companyInfo;

function setBal() public {

    Company storage _Company = companyInfo[msg.sender]// 
    _Company.name = "Apple";



}