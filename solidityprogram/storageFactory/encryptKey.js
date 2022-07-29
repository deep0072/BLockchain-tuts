require("dotenv").config();
const fs = require("fs-extra");
const ethers = require("ethers");

async function encryptKey() {
  const wallet = new ethers.Wallet(process.env.PRIVATE_KEY);
  const encryptedJsonKey = await wallet.encrypt(
    process.env.Password,
    process.env.PRIVATE_KEY
  );
  console.log(encryptedJsonKey);
  fs.writeFileSync("./.encryptedKeys", encryptedJsonKey);
}
encryptKey()
  .then(() => process.exit(0))
  .catch((err) => {
    console.log(err);
    process.exit(1);
  });
