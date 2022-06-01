pragma solidity >= 0.7.5 <= 0.9.5;


// falback function are executed when functions are not existed sends directly ether if fallback function is payable
//so if someone call function foo inside this contract but it is not available then fallback function will call by default

contract fallBackContract{
    /*before a contract need to send ether it first need to recieve ether
    so first create payable constructor 
    */


        event Log(string func, address sender, uint value, bytes data);

        fallback () external payable {
            emit Log("fallback", msg.sender, msg.value, msg.data);

        }

        receive () external payable {
            emit Log("recieve", msg.sender,msg.value,"");
        }
    }

  


