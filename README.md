# BLockchain-tuts


# Solidity functions

 ## in solidity data types are of 2 types
 ### values , reference
  
  #### values ==> these store data values. e.g. int store number
  
  #### refrence ==> these store the refrence to the exact data. e.g. array that refrence to exact element of array.
  
  
 
 # Functions is solidity
 
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
 
 
 ## type of variable
 ### 1. local 2. global 3. state
 
 ### 1. state variable ==> which store data on blockchain and decalred outside the function. lets take an example of it
 
![image](https://user-images.githubusercontent.com/46425800/170218100-863c34b7-625d-4d92-b9e9-a6db597fbc58.png)

### 2. Local variables ==> these var that declared inside the function. 
![image](https://user-images.githubusercontent.com/46425800/170220498-be6ee68d-e570-4039-92f2-f4d85fb38089.png)

### 3. Global variable ==> these var that store information such blockchain transactions. block number, block timestamp.account address (msg.sender) that call the function.

![image](https://user-images.githubusercontent.com/46425800/170225354-25e56b5b-e6b8-4a25-bfcc-0f1d580172f8.png)



 
 

 
 
