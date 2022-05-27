# BLockchain-tuts




 ## in solidity data types are of 2 types
 ### values , reference
  
  #### values ==> these store data values. e.g. int store number
  
  #### refrence ==> these store the refrence to the exact data. e.g. array that refrence to exact element of array.
  
  
 
 # Solidity functions
 
 ### two type of function 
 ### 1. create transaction:==> means write data on blokchain
 ### 2. reads and retrun value of variable.
 
 
 ## Pure function
 ### a function that do not modify the state of variable in existing code
 ### function that do not read the existing variable in code 
 
 
 ## view function
 
 ### a function that do not modify the current the state of variable
 ### also read the existing variable in code
 
 
 ## example of invalid pure function  
 ![image](https://user-images.githubusercontent.com/46425800/170017269-8857bf35-fb96-4a7f-89b6-7871ba0a9dfe.png)
 
 ## example of invalid view function 
 ![image](https://user-images.githubusercontent.com/46425800/170017530-ed319ce6-16cc-4c32-8be4-984e01b365b5.png)
 
 
 ## modifier function
 
 ### these function are used to remove the redundancy in solidity.
 ### understand with example
 ![image](https://user-images.githubusercontent.com/46425800/170772765-7c9b541f-3ed2-490b-9fb2-1f97aa91ac47.png)
 
 ### here in this snap shot we can use the require multiple time in these function but that would be redundant in nature 
 <br>

 
 
 # Variables
 
 ## type of variable
 ### 1. local 2. global 3. state
 
 ### 1. state variable ==> which store data on blockchain and decalred outside the function. lets take an example of it
 
![image](https://user-images.githubusercontent.com/46425800/170218100-863c34b7-625d-4d92-b9e9-a6db597fbc58.png)

### 2. Local variables ==> these var that declared inside the function. 
![image](https://user-images.githubusercontent.com/46425800/170220498-be6ee68d-e570-4039-92f2-f4d85fb38089.png)

### 3. Global variable ==> these var that store information such blockchain transactions. block number, block timestamp.account address (msg.sender) that call the function.

![image](https://user-images.githubusercontent.com/46425800/170225354-25e56b5b-e6b8-4a25-bfcc-0f1d580172f8.png)


## Constants

### Constant ==> some time there is a state variable  that do not change. so we need to declate regular state variable as constant. constant variable always use less gas fee.
### lets understand it with example
![image](https://user-images.githubusercontent.com/46425800/170443559-dc67e95a-4229-4b43-9c7d-63b07e89c413.png)






## Default values in solidity
###  bool  public  b;  // false 
###    int256  public  i;  // 0 
###    uint256  public u; // 0 
###    address  public  addr;  // 0X00000000000000000000000000000000 
###    bytes32  public  b32;  // 0x000000000000000000000000000000000000 


# Errors

## error handling are moslty done to prevent the uneceesary use of gas. means refund of gas, any variable that is updated will  be reverted

## error handling done using require, assert, revert

### require ==> it is mostly used to validate the user inputs and for access control who gets to call the function

![image](https://user-images.githubusercontent.com/46425800/170763867-672e473e-377f-4eda-958d-fdb9c432ab58.png)


### revert ==> it is also does same thing as require but it is mostly used to prefer in nested condtions.

![image](https://user-images.githubusercontent.com/46425800/170763999-a4c8bd56-b029-4896-84d1-f4393675bb8f.png)


### assert ==> it will be always used to check for conditions that should always be true

![image](https://user-images.githubusercontent.com/46425800/170764125-f739ef1b-bbbb-4d57-a5ce-6b47491dc1a3.png)




 
 

 
 
