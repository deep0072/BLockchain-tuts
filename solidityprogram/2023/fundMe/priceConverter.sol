/**

Libraries are similar to contracts, but you can't declare any state variable and you can't send ether.

A library is embedded into the contract if all library functions are internal.

Otherwise the library must be deployed and then linked before the contract is deployed.




 */

import "./Interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice() internal view returns (uint256) {
         AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

        (,int256 price,  , , ) = priceFeed.latestRoundData();
        // price return in usd will be followed by 10 zeros

        return uint256(price*1e10);
    }

    function ethConversionRate(
        uint256 amountOfEth
    ) internal view returns (uint256) {
        uint256 ethPrice = getPrice();

        uint256 amountOfEthInUsd = (ethPrice * amountOfEth) / 1e18;

        return amountOfEthInUsd;
    }
}
