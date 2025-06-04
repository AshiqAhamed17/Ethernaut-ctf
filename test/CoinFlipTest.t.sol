// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/CoinFlip.sol";

contract CoinFlipTest is Test {

    CoinFlip public coin;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function setUp() public {
        coin = new CoinFlip();
    }

    function testCoinFlip() public {
        

        uint16 wins = 0;

        while( wins < 10) {
            vm.roll(block.number + 1);
            uint256 predictedHash = uint256(blockhash(block.number - 1));
            uint256 predictedNumber = predictedHash / FACTOR;
            
            if(predictedNumber == 1) {
                coin.flip(true);
                console.log("Correct pred");
                wins++;
            }
            else {
                console.log("Bad prediction");
            }
        }

        
        assertEq(wins, 10, "Failed to reach 10");
    }
}