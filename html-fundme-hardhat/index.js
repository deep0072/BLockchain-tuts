import { ethers } from "./ethers-5.6.esm.min.js";
import { abi, contractAddress } from "./constants.js";

const connectButton = document.getElementById("connectButton");
const fundButton = document.getElementById("fundButton");
connectButton.onclick = connect;
fundButton.onclick = Fund;

async function connect() {
  if (typeof window.ethereum !== "undefined") {
    await window.ethereum.request({ method: "eth_requestAccounts" });
    console.log("connected..");
    document.getElementById("connectButton").innerHTML = "connected";
  } else {
    document.getElementById("connectButton").innerHTML = "install metamask";
  }
}

async function Fund() {
  const ethAmount = document.getElementById("ethAmount").value;
  if (typeof window.ethereum != "undefined") {
    console.log("funding.....");
    // get connection to blockchain with help of provider
    // signer/wallet /someone  with some gas
    //contract that we are interacting
    //ABI and ADDRESs
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const signer = await provider.getSigner();
    console.log(signer.getAddress(), "signer");

    const contract = new ethers.Contract(contractAddress, abi, signer);
    try {
      const transactionResponse = await contract.fund({
        value: ethers.utils.parseEther(ethAmount),
      });
      // now wait for this transaction to finish
      await listenForTransaction(transactionResponse, provider);
      console.log("done!");
    } catch (error) {
      console.log(error);
    }
  }
}

function listenForTransaction(transactionResponse, provider) {
  console.log(`Mining ${transactionResponse.hash}.............`);
  // now listen this transaction from blockhain
  // once is listener that log the event from blokchain
  return new Promise((resolve, reject) => {
    provider.once(transactionResponse.hash, (transReceipt) => {
      console.log(`Completed with ${transReceipt.confirmations} confirmations`);
      resolve()
    });
    
  });
}
