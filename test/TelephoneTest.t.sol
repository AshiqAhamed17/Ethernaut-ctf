// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {Telephone, AttackTelephone} from  "../src/Telephone.sol";


contract TelephoneTest is Test {
    Telephone public tel;
    AttackTelephone public attack;

    //address public victim = makeAddr("victim");
    address public attacker = makeAddr("attacker");

    function setUp() public {
        tel = new Telephone();
        attack = new AttackTelephone(tel);
    }

    function test_owner() public {

        address initialOwner = tel.owner(); 
        console.log("Initial Contract Owner: ", initialOwner);

        vm.prank(attacker);
        attack.attackTel();

        console.log("After attack owner: ", tel.owner());

        assertEq(attacker, tel.owner(), "Owner is not the same");

    }
}