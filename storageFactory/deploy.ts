// connect to local node via using rpc url using provider
// connected to local wallet with help of private key
// in order to deploy contract we need
// read abi of contract using fs module
//  read bytecode of contract
// contract factory==> in ethers is just an object to deploy smart contract.
// then use deploy method to deploy contract

// here require meaning is to import
// const ethers = require("ethers");
// const fs = require("fs-extra");
// require("dotenv").config();
import {ethers} from "ethers"
import * as fs from "fs-extra"
import "dotenv/config"

async function main() {
  // http: HTTP://127.0.0.1:7545 ==> rpc url that you are using to connect to your local node blockchain

  // connect to local node via using rpc url
  const provider = new ethers.providers.JsonRpcProvider(process.env.RPC_URL!);

  // connected to local wallet
  const wallet = new ethers.Wallet(process.env.PRIVATE_KEY!, provider);

  const abi = fs.readFileSync("./simpleStorage_sol_simpleStorage.abi", "utf8"); // read abi  file
  const binary = fs.readFileSync(
    "./simpleStorage_sol_simpleStorage.bin",
    "utf8"
  );

  const contractFactory = new ethers.ContractFactory(abi, binary, wallet); //initialising the contract facotry to deploy smart contract
  console.log("deploying just wait......");

  const contract = await contractFactory.deploy(); // await means stop here until this deploy

  // get the function defined in smartcontract using ether js
  const currentFavourite = await contract.retreive();
  console.log(`current favourite number:${currentFavourite.toString()}`);

  // update the number by calling function "store" from smartcontract
  // here we are passing string pram where solidity smart enough to know about the string is number or not
  const transactionResponse = await contract.store("10");

  const transreciept = await transactionResponse.wait(1); // waiting for deplying atleast one block on chain itself
  const updatedData = await contract.retreive();
  console.log(`updated number: ${updatedData}`);

  // here creating transactional data that is going to use during deployment of smartcontract
  // const nonce = await wallet.getTransactionCount()
  // console.log(nonce)
  // const tx = {
  //   nonce:nonce,
  //   gasPrice:20000000000,
  //   gasLimit:1000000,
  //   to:null,
  //   value:0,
  //   data:"0x608060405234801561001057600080fd5b50610851806100206000396000f3fe608060405234801561001057600080fd5b50600436106100575760003560e01c806343ede4ae1461005c5780636057361d1461007a5780636f760f41146100965780639e7a13ad146100b2578063b05784b8146100e3575b600080fd5b610064610101565b604051610071919061025b565b60405180910390f35b610094600480360381019061008f91906102b6565b610107565b005b6100b060048036038101906100ab9190610429565b610111565b005b6100cc60048036038101906100c791906102b6565b61017d565b6040516100da92919061050d565b60405180910390f35b6100eb610239565b6040516100f8919061025b565b60405180910390f35b60005481565b8060008190555050565b600060405180604001604052808481526020018381525090506001819080600181540180825580915050600190039060005260206000209060020201600090919091909150600082015181600001908161016b9190610749565b50602082015181600101555050505050565b6001818154811061018d57600080fd5b90600052602060002090600202016000915090508060000180546101b09061056c565b80601f01602080910402602001604051908101604052809291908181526020018280546101dc9061056c565b80156102295780601f106101fe57610100808354040283529160200191610229565b820191906000526020600020905b81548152906001019060200180831161020c57829003601f168201915b5050505050908060010154905082565b60008054905090565b6000819050919050565b61025581610242565b82525050565b6000602082019050610270600083018461024c565b92915050565b6000604051905090565b600080fd5b600080fd5b61029381610242565b811461029e57600080fd5b50565b6000813590506102b08161028a565b92915050565b6000602082840312156102cc576102cb610280565b5b60006102da848285016102a1565b91505092915050565b600080fd5b600080fd5b6000601f19601f8301169050919050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052604160045260246000fd5b610336826102ed565b810181811067ffffffffffffffff82111715610355576103546102fe565b5b80604052505050565b6000610368610276565b9050610374828261032d565b919050565b600067ffffffffffffffff821115610394576103936102fe565b5b61039d826102ed565b9050602081019050919050565b82818337600083830152505050565b60006103cc6103c784610379565b61035e565b9050828152602081018484840111156103e8576103e76102e8565b5b6103f38482856103aa565b509392505050565b600082601f8301126104105761040f6102e3565b5b81356104208482602086016103b9565b91505092915050565b600080604083850312156104405761043f610280565b5b600083013567ffffffffffffffff81111561045e5761045d610285565b5b61046a858286016103fb565b925050602061047b858286016102a1565b9150509250929050565b600081519050919050565b600082825260208201905092915050565b60005b838110156104bf5780820151818401526020810190506104a4565b838111156104ce576000848401525b50505050565b60006104df82610485565b6104e98185610490565b93506104f98185602086016104a1565b610502816102ed565b840191505092915050565b6000604082019050818103600083015261052781856104d4565b9050610536602083018461024c565b9392505050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052602260045260246000fd5b6000600282049050600182168061058457607f821691505b6020821081036105975761059661053d565b5b50919050565b60008190508160005260206000209050919050565b60006020601f8301049050919050565b600082821b905092915050565b6000600883026105ff7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff826105c2565b61060986836105c2565b95508019841693508086168417925050509392505050565b6000819050919050565b600061064661064161063c84610242565b610621565b610242565b9050919050565b6000819050919050565b6106608361062b565b61067461066c8261064d565b8484546105cf565b825550505050565b600090565b61068961067c565b610694818484610657565b505050565b5b818110156106b8576106ad600082610681565b60018101905061069a565b5050565b601f8211156106fd576106ce8161059d565b6106d7846105b2565b810160208510156106e6578190505b6106fa6106f2856105b2565b830182610699565b50505b505050565b600082821c905092915050565b600061072060001984600802610702565b1980831691505092915050565b6000610739838361070f565b9150826002028217905092915050565b61075282610485565b67ffffffffffffffff81111561076b5761076a6102fe565b5b610775825461056c565b6107808282856106bc565b600060209050601f8311600181146107b357600084156107a1578287015190505b6107ab858261072d565b865550610813565b601f1984166107c18661059d565b60005b828110156107e9578489015182556001820191506020850194506020810190506107c4565b868310156108065784890151610802601f89168261070f565b8355505b6001600288020188555050505b50505050505056fea26469706673582212203dd1221867d501d8eabdaf85f238484ff8fa13923b9f6cd280d710fdec2d2fa764736f6c634300080f0033",
  //   chainId:1337,

  // }

  // const signedTx = await wallet.sendTransaction(tx)
  // await signedTx.wait(1) // here waiting for one block confirmation
  // console.log(signedTx)
}

main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.log(err);
    process.exit(1);
  });
