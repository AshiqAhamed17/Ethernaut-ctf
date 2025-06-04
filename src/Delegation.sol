// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Delegate {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }

    // Can be called to get owner.
    function pwn() public {
        owner = msg.sender;
    }
}

contract Delegation {
    address public owner;
    Delegate delegate;

    constructor(address _delegateAddress) {
        delegate = Delegate(_delegateAddress);
        owner = msg.sender;
    }

    fallback() external {
        //msg.data should be the encoded function of pwn function() =>  0xdd365b8b
        // (bool result,) = address(delegate).delegatecall(abi.encodeWithSignature(arg));
        (bool result,) = address(delegate).delegatecall(msg.data);
        if (result) {
            this;
        }
    }

}