const networkConfig = {
  4: {
    name: "rinkeby",
    ethUsdPriceFeedAddress: "0x8A753747A1Fa494EC906cE90E9f37563A8AF630e",
  },
  137: {
    name: "polygon",
    ethUsdPriceFeedAddress: " 0xF9680D99D6C9589e2a93a78A04A279e509205945",
  },
  5: {
    name: "goerli",
    ethUsdPriceFeedAddress: "0x8A753747A1Fa494EC906cE90E9f37563A8AF630e",
  },
};

const developmentChains = ["hardhat", "localhost"];
const DECIMAL = 8;
const INITIAL_ANSWER = 200000000000;
module.exports = {
  networkConfig,
  developmentChains,
  DECIMAL,
  INITIAL_ANSWER,
};
