const ethers = require("ethers");
const fs = require("fs-extra");
require("dotenv").config();
async function main() {
  /*
    1. connect to the rpc
    2. then read encrypted keys
    3. with help of saved password use decrypt the keys

    4. then connect wallet and deploy

    */

  const provider = new ethers.providers.JsonRpcProvider(process.env.RPC_URL);

  const encryptedKeys = fs.readFileSync("./.newEncryptedKeys.json");

  console.log(encryptedKeys);

  let wallet = new ethers.Wallet.fromEncryptedJsonSync(
    encryptedKeys,
    process.env.Password
  );
  wallet = await wallet.connect(provider);
  const binary = fs.readFileSync(
    "simpleStorage_sol_simpleStorage.bin",
    "utf-8"
  );
  const abi = fs.readFileSync("simpleStorage_sol_simpleStorage.abi", "utf-8");
  const contractFactory = new ethers.ContractFactory(abi, binary, wallet);

  const contract = await contractFactory.deploy();

  console.log(await contract.retreive(), "current number");

  const updatedNumber = "45";
  await contract.store(updatedNumber);
  console.log(await contract.retreive(), "updated number.......");
}

main()
  .then(() => process.exit(1))
  .catch((err) => {
    console.log(err);
    process.exit(0);
  });

// encrypt the keys and password

// async function encryptKeystore() {
//   const wallet = new ethers.Wallet(process.env.PRIVATE_KEY);

//   let encryptedWalletKey = await wallet.encrypt(
//     process.env.Password,
//     process.env.PRIVATE_KEY
//   );

//   console.log(encryptedWalletKey);

//   fs.writeFileSync("./.newEncryptedKeys.json", encryptedWalletKey);
// }

// encryptKeystore()
//   .then(() => process.exit(1))
//   .catch((err) => {
//     console.log(err);
//     process.exit(1);
//   });
