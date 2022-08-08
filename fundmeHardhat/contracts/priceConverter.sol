pragma solidity ^0.8.7;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library priceConvert {
    // to get the value of eth in usd  we need to interact with other address
    function getPrice(AggregatorV3Interface priceFeed)
        internal
        view
        returns (uint256)
    {
        // get address of the conract that give price of eth ==> 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e

        (
            ,
            /*uint80 roundID*/
            int256 price, /*uint startedAt*/ /*uint timeStamp*/ /*uint80 answeredInRound*/
            ,
            ,

        ) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
        // return price of eth lets assume 1200 dollar follower by 18 digit
    }

    function getConversion(uint256 amounteth, AggregatorV3Interface priceFeed)
        internal
        view
        returns (uint256)
    {
        uint256 ethPrice = getPrice(priceFeed); // eprice 1500 dollar followed  by 18 digit
        // amount of eth also follwod by 18 zeros
        // then multiply price with amout of th
        /*3000000000000000000000*1000000000000000000/1000000000000000000
        3e+21
       
 
        */

        uint256 ethUSD = (amounteth * ethPrice) / 1e18;
        return ethUSD;
    }
}
