require("dotenv").config();
const fs = require("fs-extra");
const ethers = require("ethers");

async function encryptKey() {
  console.log(process.env.PRIVATE_KEY, "private_key");
  const wallet = new ethers.Wallet(process.env.PRIVATE_KEY);
  const encryptedJsonKey = await wallet.encrypt(
    process.env.Password,
    process.env.PRIVATE_KEY
  );
  console.log(encryptedJsonKey);
  fs.writeFileSync("./.encryptedKeys.json", encryptedJsonKey);
}
encryptKey()
  .then(() => process.exit(0))
  .catch((err) => {
    console.log(err);
    process.exit(1);
  });
