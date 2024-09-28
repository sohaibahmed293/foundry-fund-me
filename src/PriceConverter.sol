// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
    function getPrice(AggregatorV3Interface priceFeed) internal view returns (uint256) {
        // to reach out and work with a contract, we need 2 things
        // 1. Address (ETH/USD) zksync Sepolia   0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF
        // 2. ABI

//        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF);
        (, int256 price, , ,) = priceFeed.latestRoundData();
        // price of ETH in terms of USD

        return uint256(price * 1e10);

    }

    // returns price in USD but with 18 0's
    function getConversionRate(uint256 ethAmount, AggregatorV3Interface priceFeed) internal view returns(uint256) {
        uint256 ethPrice = getPrice(priceFeed);
        uint256 ethAmountInUSD = (ethAmount * ethPrice) / 1e18;
        return ethAmountInUSD;
    }
}