# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
yarn hardhat help
yarn hardhat test
GAS_REPORT=true yarn hardhat test
yarn hardhat node
yarn hardhat run scripts/deploy.js

### to deploy smartcontract on specific network we use the following command:
yarn hardhat run deploy --network <network-name>
```

by default it uses harhdhat network

```

```

### to clean artifacts and cache

yarn hardhat clean

```
```
## testing smartContract

command for test yarn hardhat test

#### in test folder write test_Script
#### structure

describe is keyword that take 2 params. first is smartcontract name or any msg. second one will be async function. 
 then in async function we will use beforeeach keyword that is function which tell us before testing we need to deploya the smartcontract.

 so when we deploy then after this function we will use it()
 keyword that take 2 params. one is msg that we want to test kind of msg. second one will be async function that will try to get each function of deployed smart contract.


#### if i want to test perticulat testing scenario then use this command
yarn hardhat test --grep "msg that is describing in "it" params"

![image](https://user-images.githubusercontent.com/46425800/183158734-5eeb2386-57e2-4be7-898b-d56613e760bc.png)

as ypu can see therare two "it"
if i use yarn hardhat test --grep "should start with zero"

then it will test only first case
""
