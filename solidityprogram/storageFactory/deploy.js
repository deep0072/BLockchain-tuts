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

async function main() {
  // http: HTTP://127.0.0.1:7545 ==> rpc url that you are using to connect to your local node blockchain

  const provider = new ethers.providers.JsonRpcProvider(
    "HTTP://127.0.0.1:7545"
  );

  const wallet = new ethers.Wallet(
    "bb791b7ac9e2147bea16f83980ee1303d895fe66071ae67f43695bb7961b89ab",
    provider
  );
  // connect to local node via using rpc url
  // connected to local wallet

  // in order to deploy contract we need
  // read abi of contract
  //  read bytecode of contract
  // contract factory==> in ethers is just an object to deploy smart contract.
  // then use deploy method to deploy contract

  const abi = fs.readFileSync("./simpleStorage_sol_simpleStorage.abi", "utf8"); // read abi  file
  const binary = fs.readFileSync(
    "./simpleStorage_sol_simpleStorage.bin",
    "utf8"
  );

  const contractFactory = new ethers.ContractFactory(abi, binary, wallet);
  console.log("deploying just wait......");

  const contract = await contractFactory.deploy(); // await means stop here until this deploy
  console.log(contract);
}

main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.log(err);
    process.exit(1);
  });
