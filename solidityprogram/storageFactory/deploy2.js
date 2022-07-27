// connect to local node via using rpc url using provider
// connected to local wallet with help of private key
// in order to deploy contract we need
// read abi of contract using fs module
//  read bytecode of contract
// contract factory==> in ethers is just an object to deploy smart contract.
// then use deploy method to deploy contract

const ethers = require("ethers");
const fs = require("fs-extra");

async function main() {
  const provider = new ethers.providers.JsonRpcProvider(
    "HTTP://127.0.0.1:7545"
  );
  const wallet = new ethers.Wallet(
    "1d27f627e93b402743bb6d42a97d9cf95e9a1fe32660556852ebaf5e39f87be1",
    provider
  );
  const abi = fs.readFileSync("./simpleStorage_sol_simpleStorage.abi", "utf8");
  const binary = fs.readFileSync(
    "./simpleStorage_sol_simpleStorage.bin",
    "utf8"
  );
  const contractFactory = new ethers.ContractFactory(abi, binary, wallet);
  console.log("deploying contract........");
  const contract = await contractFactory.deploy();
  console.log(contract);
}

main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.log(err);
    process.exit(1);
  });
