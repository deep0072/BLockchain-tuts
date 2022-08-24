import {ethers} from "./ethers-5.6.esm.min.js"
import {abi, contractAddress} from "./constants.js"


const connectButton = document.getElementById("connectButton")
const fundButton = document.getElementById("fundButton")
connectButton.onclick = connect
fundButton.onclick = Fund


async function connect() {
  if (typeof window.ethereum !== "undefined") {
    await window.ethereum.request({ method: "eth_requestAccounts" });
    console.log("connected..");
    document.getElementById("connectButton").innerHTML = "connected";
  } else {
    document.getElementById("connectButton").innerHTML = "install metamask";
  }
}

async function Fund(){
  const ethAmount = "77"
  if (typeof window.ethereum != "undefined"){
    console.log("funding.....")
    // get connection to blockchain with help of provider
    // signer/wallet /someone  with some gas
    //contract that we are interacting
    //ABI and ADDRESs
    const provider = new ethers.providers.Web3Provider(window.ethereum)
    console.log(contractAddress)
    const signer = provider.getSigner()
    console.log(signer)
    const contract = new ethers.Contract(abi,contractAddress,signer)

    try{
      const trasactionResponse = contract.fund({value: ethers.utils.parseEther(ethAmount)})
      

    }catch (error) {
      console.log(error)
    }
  
  
    console.log(signer)


  } 
}