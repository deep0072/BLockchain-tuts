/**

Libraries are similar to contracts, but you can't declare any state variable and you can't send ether.

A library is embedded into the contract if all library functions are internal.

Otherwise the library must be deployed and then linked before the contract is deployed.




 */

import "./Interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice() internal view returns (uint256) {
        (, int256 priceFeed, , , ) = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );

        uint256 ethPriceInUsd = priceFeed.latestRoundData();
        return uint256(ethPriceInUsd);
    }

    function ethConversionRate(
        uint256 amountOfEth
    ) internal view returns (uint256) {
        uint256 ethPrice = getPrice();

        uint256 amountOfEthInUsd = (ethPrice * amountOfEth) / 1e18;

        return amountOfEthInUsd;
    }
}
