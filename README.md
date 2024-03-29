# BLockchain-tuts

## solidity style Guide

<li>error code</li>
<li> library</li>
<li>interfaces</li>
<li>contract</li>
<li>then type Declarations</li>
<li>state variable decelration</li>
<li>event </li>
<li>modifier </li>
<li>constructor </li>
<li>recieve fallback fucntion </li>
<li>external function </li>
<li>public function</li>
<li>internal function </li>
<li>view pure function </li>

# before dive into blockchain check this one of the best explaination of Consesus

![image](https://user-images.githubusercontent.com/46425800/173658194-e01dee4f-69ec-4f27-a625-699c6cbdb684.png)

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

### a function that do not modify the current the state of variable.AND READ DATA FROM BLOCKCHAIN

### also read the existing variable in code

## example of invalid pure function

![image](https://user-images.githubusercontent.com/46425800/170017269-8857bf35-fb96-4a7f-89b6-7871ba0a9dfe.png)

## example of invalid view function

![image](https://user-images.githubusercontent.com/46425800/170017530-ed319ce6-16cc-4c32-8be4-984e01b365b5.png)

## view and pure function only cost gas when they are called by function which cost gas

## modifier function :

### these function are used to remove the redundancy in solidity.

### understand with example

![image](https://user-images.githubusercontent.com/46425800/170772765-7c9b541f-3ed2-490b-9fb2-1f97aa91ac47.png)

### here in this snap shot we can use the require multiple time in these function but that would be redundant in nature

 <br>
 
 ## Contructor
 ## these are the function that call once when we deploy the smartcontract. mostly used to intialise the variables
 
 ![image](https://user-images.githubusercontent.com/46425800/170775979-d58b3276-5664-4b39-af18-8064a71ec600.png)
 <br>
 <br>

# Variables

## type of variable

### 1. local 2. global 3. state

### 1. state variable ==> which store data on blockchain and decalred outside the function. lets take an example of it. also store permanently on blockchain

![image](https://user-images.githubusercontent.com/46425800/170218100-863c34b7-625d-4d92-b9e9-a6db597fbc58.png)

### storage keyword ==> if want to change statevariable infos in function then i need to used storage keyword. just to tell the solidity data will be changed in permanent storage.cant be used in parameter though

![image](https://user-images.githubusercontent.com/46425800/170856556-97be53c1-7f61-4d02-a4ee-1311a32b111f.png)

<br> 
<br>

### memory keyword ==> if you use memory then statevariable will not be updated. as you can see the company name in given below snap shots. btw in latest version of solidity.all variable intialised inside the function set to memory localtion by default.

![image](https://user-images.githubusercontent.com/46425800/170856572-300be7c5-1f1e-4c08-a0e9-5581e5ec4c2e.png)

### 2. Local variables ==> these var that declared inside the function. these store data in memory which is temporary in nature

![image](https://user-images.githubusercontent.com/46425800/170220498-be6ee68d-e570-4039-92f2-f4d85fb38089.png)

### 3. Global variable ==> these var that store information such blockchain transactions. block number, block timestamp.account address (msg.sender) that call the function.

![image](https://user-images.githubusercontent.com/46425800/170225354-25e56b5b-e6b8-4a25-bfcc-0f1d580172f8.png)

## Constants

### Constant ==> some time there is a state variable that do not change. so we need to declate regular state variable as constant. constant variable always use less gas fee.

<br>

## immutable variable 
### Immutbale ==> some time there is a state variable that do not change like constant variable . so we need to declate regular state variable as immutable. these can bde declared one time in the "constructor".

### lets understand it with example

![image](https://user-images.githubusercontent.com/46425800/170443559-dc67e95a-4229-4b43-9c7d-63b07e89c413.png)

## Default values in solidity

### bool public b; // false

### int256 public i; // 0

### uint256 public u; // 0

### address public addr; // 0X00000000000000000000000000000000

### bytes32 public b32; // 0x000000000000000000000000000000000000

# Errors

## error handling are moslty done to prevent the uneceesary use of gas. means refund of gas, any variable that is updated will be reverted

## error handling done using require, assert, revert

### require ==> it is mostly used to validate the user inputs and for access control who gets to call the function

![image](https://user-images.githubusercontent.com/46425800/170763867-672e473e-377f-4eda-958d-fdb9c432ab58.png)

### revert ==> it is also does same thing as require but it is mostly used to prefer in nested condtions.

![image](https://user-images.githubusercontent.com/46425800/170763999-a4c8bd56-b029-4896-84d1-f4393675bb8f.png)

### assert ==> it will be always used to check for conditions that should always be true

![image](https://user-images.githubusercontent.com/46425800/170764125-f739ef1b-bbbb-4d57-a5ce-6b47491dc1a3.png)

# Array

### Dynamic array ==> not fixed size of array

## syntax = uint [] public arr

### fixed array => fixed size of array

### uint [4] public fixedArr; // can store upto 4 elements

### intialise the array

### uint [] public num = [45,67,23,6,45];

### // intialise the array with fixed size

### uint [5] public num = [45,67,23,6,45]

## Array operation

### adding element in num array

### nums = [45,67,23,6,45]

### nums.push(50) ==> nums = [45,67,23,6,45,50]

### delete element from array

### delete num [2]; // delete element at index 2 but it will set 0 element at 2nd postion

### nums = [45,67,0,6,45,50]

### pop == this method will remove element from last index of an array

### num.pop(); // removed last element nums = [45,67,23,6,45] that is 50

### get size of array

### nums.length

### create an array in memory

### uint[] memeory nums = new uint[](5); array in memory with fixed size of 5

### in this pop and push will not work

### returning array in function

![image](https://user-images.githubusercontent.com/46425800/170819991-c419ee04-bd0e-4457-b4fc-99c167301a1f.png)

# MAPPING

## mapping is like dictionary in python and object in js. store key value pair. {"0x5B38Da6a701c568545dCfcB03FcB875f56beddC4": 565666}

## syntax = mapping(type of key==> type of value) public balances

## to add key and update key in mapping

![image](https://user-images.githubusercontent.com/46425800/170831716-bfb8c4e4-860f-4bf7-89cf-0d7f79baec8c.png)

## to delete thevalue from mapping. it will leave the value of key default value that is declared varibale

![image](https://user-images.githubusercontent.com/46425800/170831750-d843b149-9edd-4978-9097-4efb37d68da6.png)

# STRUCTS

## structs are used to create own types of variable

## store multiple types of data

### syntax : struct {type1 var1, type2 var2}

### initialization of struct

![image](https://user-images.githubusercontent.com/46425800/170838027-e438cefa-3195-4229-862d-3cb415b0bc2f.png)

### with the help of dot notation we can also put data into struct

![image](https://user-images.githubusercontent.com/46425800/170838054-9460f6a7-75ab-449a-bad4-b40829ec6742.png

# Call Data

### this is type of memory location where variable is declared and used in inputs. so whenever it is used by another function then that data do not copied in memory. it directly used. so it save gas. """once we declare the variable it can't be modified"""

### string can be stored in calldata

# Memory

### this is type of memory location where variable is declared and used in inputs. used for temporary value also can be modified

### data like structs,mapping,array, string can be stored in memory

### ![image](https://user-images.githubusercontent.com/46425800/170858826-2f1b6a68-cb2d-41de-a0ad-4ce676a07ff3.png)

# to import specific contract from file use

### import {specificContract} from "file .sol"

<br>
# 3 ways to send ether

## transfer ==> ### use 2308 gas, if trasfer fail for some reason then whole function fails

## send ==> ### use 2300 gas, returns bool in case of successful trasaction or not

## call - ### all gas, returns bool and data

# falback function

### these are executed when functions are not existed sends directly ether if fallback function is payable

### so if someone call function foo inside this contract but it is not available then fallback function will call by default

### if msg.data is not empty then fallback function are called

### if msg.data is empty then receive function are called

![image](https://user-images.githubusercontent.com/46425800/171462615-9376702f-5c03-48de-9b80-2b598de47bf8.png)

# InterFace

### these are act as abstraction. these found on top of contract. theae are used to import other contract code. that helps use to avoid the duplication.

### lets understand with it example. here in this snapshot there is Counter smart contract. we want to use its Inc() function in other external contract.

![image](https://user-images.githubusercontent.com/46425800/173636135-49b76aae-1dc0-466a-a436-fc9061009535.png)

### this is another contract in which we import above given smartcontract by using interface keyword.

![image](https://user-images.githubusercontent.com/46425800/173636305-fe112a03-ee18-4561-9855-f432e7fd2e91.png)

### if we want to modifie the parent function. then we need to use virtual keyword in parent function and use that same function in child and use override keyword in that function. also visibility of parent and child function should not be differd. check the snap shot of it.

![image](https://user-images.githubusercontent.com/46425800/177289245-41a24e75-96e5-4450-98fc-e50b7f677ebd.png)

<br>
<br>
<br>
<br>

# Library in solidity

### similar to contracts that contain reusable codes. A library has functions that can be called by other contracts.

### Deploying a common code by creating a library reduces the gas cost.

### but you can't declare any state variable and you can't send ether.

#### in this snap shot library is declared outside the function. then in contract library function are accesed using dot notations

![image](https://user-images.githubusercontent.com/46425800/174497100-93ec4da7-2110-4623-ab74-77cfab2e5d4e.png)
![image](https://user-images.githubusercontent.com/46425800/174131166-c4faa8f0-a05c-418e-be0f-ce00c14d0102.png)

# selfDestruct inBUilt function

### used to delete the contract and send its all eth to mentioned address in built function it self

### when we try to call the function from deleted contract. they will not work

### check snap shot

![image](https://user-images.githubusercontent.com/46425800/174497113-9a41568d-b6d0-4529-b02c-6b6af291d840.png)

# Erc20 standard with function

## It effectively allows smart contracts to act very similarly to a conventional cryptocurrency like Bitcoin, or Ethereum itself. In saying this, a token hosted on the Ethereum blockchain can be sent, received, checked of its total supply, and checked for the amount that is available on an individual address

### ERC20 defines the functions balanceOf , totalSupply , transfer , transferFrom , approve , and allowance

### balanceOf() ==> it allaows smartcontract to store and return the balance of the provided address.

### transfer() ==> This function lets the owner of the contract send a given amount of the token to another address just like a conventional cryptocurrency transaction

### approve function ==> This function lets the owner of the contract approve a given amount of tokens to be spent on behalf of another address.means lets say i am the owner of wallet and i decide whoever want to spend my tokne. i will allow them to spend my token. by giving approval. i will set the limit that the other wallet spend my token.

![image](https://user-images.githubusercontent.com/46425800/175827880-14e928df-9834-4e6c-9731-41ca1e98c032.png)

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

### allowance function ==> This function lets the owner of the contract check the amount of tokens that have been approved for spending on behalf of another address.menas if i am the owner of my wallet and my friend has spend my token on behalf of my wallet. so this function to check how much allowance is remaining for my friend.

!![image](https://user-images.githubusercontent.com/46425800/175827917-7d7786e0-63f2-4c82-ad37-d69a9ab3b65b.png)

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

### transferFrom function ==> This function lets the owner of the contract transfer a given amount of tokens from one address to another address.one address corresponds to the who actual have the token and other address is the one who want to spend the token. transferFrom function is used to spend the token on behalf of the owner of the contract.

![image](https://user-images.githubusercontent.com/46425800/175812629-4871ebe8-bd9b-4a45-9dda-519b6b06dc85.png)

# PRIVATE key, Public Key, address

### public key = it is the function of private key and Elliptic Curve Digital Signature Algorithm

### ECDSA to the private key, we get a 64-byte integer, which is two 32-byte integers that represent X and Y of the point on the elliptic curve

### Address of Account = To make an address from the public key, all we need to do is to apply Keccak-256 to the key and then take the last 20 bytes of the result

![image](https://user-images.githubusercontent.com/46425800/178487058-edb155e1-fbf6-44f7-84e3-f5687e398e77.png)

### contract address = The contract address is usually given when a contract is deployed to the Ethereum Blockchain. The address comes from the creator's address and the number of transactions sent from that address (the “nonce”)

# Compilation and deploying using JS

### solc js is used to compile and deploy the solidity code.

<br>

### to compile with the help of "solcjs" use the following command

#### yarn solcjs --bin --abi --include-path node_modules/ --base-path . -0 . simpleStorage.sol

#### --base path ==> it is used to specify the path where the solidity code is present.

#### -o with dot ==> it is used to specify the path where the output file is to be stored.


# function signature

### This is a string that defines the function name and its parameter

# function selector 
### its the first four bytes of a function signature. which gives the idea about which function is called.

![image](https://github.com/deep0072/BLockchain-tuts/assets/46425800/caadb919-6cd1-4608-b076-2302193ebc6d)
<br>

# callData

``` call data are function parameter passed to function```

#  abi.encodeWithSignature(functionSignature(), args) 

##  it takes two params first is function signature( function name with its params in string) and second is the function parameter. used to call function directly by just mentioning its name in string and passing arguments.
```abi.encodeWithSignature("transfer(address,uint256)", someAddress, amount)```
<br>
#  abi.encodeWithSelector(dunctionSelectior(), args) 

##  it takes two params first is the function signature( function name with its params in the string) and the second is the function parameter. used to call function directly by just mentioning  function selector(bytes format of function name) and passing arguments.
```abi.encodeWithSelector(getFunctionSelectorOne(), someAddress, amount)``` 
``` but in this we first need to get the functionSelector ```


# deelegatecall()
![image](https://github.com/deep0072/BLockchain-tuts/assets/46425800/f0abfd1d-6ed1-43a9-8bca-1214e01c6d46)
