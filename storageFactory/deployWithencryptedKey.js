// connect to local node via using rpc url using provider
// connected to local wallet with help of private key
// in order to deploy contract we need
// read abi of contract using fs module
//  read bytecode of contract
// contract factory==> in ethers is just an object to deploy smart contract.
// then use deploy method to deploy contract

// here require meaning is to import
const ethers = require("ethers");
const fs = require("fs-extra");
require("dotenv").config();

async function main() {
  // connect to local node via using rpc url
  const provider = new ethers.providers.JsonRpcProvider(process.env.RPC_URL);

  const encryptedKeys = fs.readFileSync("./.encryptedKeys.json");

  // decrypting the secret_key with help of password that is stored in env variable
  let wallet = new ethers.Wallet.fromEncryptedJsonSync(
    encryptedKeys,
    process.env.Password
  );
  console.log(wallet);

  // connected to local wallet with encrypted key
  wallet = await wallet.connect(provider);

  const abi = fs.readFileSync("./simpleStorage_sol_simpleStorage.abi", "utf8"); // read abi  file
  const binary = fs.readFileSync(
    "./simpleStorage_sol_simpleStorage.bin",
    "utf8"
  );

  const contractFactory = new ethers.ContractFactory(abi, binary, wallet); //initialising the contract facotry to deploy smart contract
  console.log("deploying just wait......");

  const contract = await contractFactory.deploy(); // await means stop here until this deploy
  console.log(`address....${contract.address}`);

  // get the function defined in smartcontract using ether js
  const currentFavourite = await contract.retreive();
  console.log(`current favourite number:${currentFavourite.toString()}`);

  // update the number by calling function "store" from smartcontract
  // here we are passing string pram where solidity smart enough to know about the string is number or not
  const transactionResponse = await contract.store("10");

  const transreciept = await transactionResponse.wait(1); // waiting for deplying atleast one block on chain itself
  const updatedData = await contract.retreive();
  console.log(`updated number: ${updatedData}`);
}

main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.log(err);
    process.exit(1);
  });
