async function connect() {
  if (typeof window.ethereum != "undefined") {
    await window.ethereum.request({ method: "eth_requestAccounts" });
    console.log("connected..");
    document.getElementById("connectButton").innerHTML = "connected";
  } else {
    document.getElementById("connectButton").innerHTML = "install metamask";
  }
}
