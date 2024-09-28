// 1. Deploy a mocks when we are on a local anvil chain
// 2. Keep track of contract addresses across different chains
// for e.g. Sepolia ETH/USD has diff address than Mainnet ETH/USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from 'forge-std/Script.sol';

contract HelperConfig is Script {

    struct NetworkConfig {
        address priceFeed; // ETH/USD price feed address
    }

    function getSepoliaEthConfig() public pure returns(NetworkConfig memory) {
        // we need price feed address
        NetworkConfig memory sepoliaConfig = NetworkConfig({ priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306 });
        return sepoliaConfig;
    }

    function getAnvilEthConfig() public pure returns(NetworkConfig memory) {
        // price feed address
    }
}