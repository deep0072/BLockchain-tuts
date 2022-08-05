pragma solidity >=0.7.5 <=0.8.9;

contract myAccount {
    address public bank;
    address public owner;

    constructor(address _owner) payable {
        bank = msg.sender;
        owner = _owner;
    }
}

/*

here ContractFactory creating another "myAccount" contract and sending ether to it 

in "myAccount" bank store the  the address of contractFactory and owner is the address who deploying the ContractFactory


 */

contract ContractFactory {
    myAccount[] public accounts;

    function createAccount(address _owner) external payable {
        myAccount account = new myAccount{value: 111}(_owner); // creating another contract using new followed by contract name and then sending ethers

        accounts.push(account);
    }
}
