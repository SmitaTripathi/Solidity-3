// SPDX-License-Identifier: MIT
//************************ERROR***************************************//
pragma solidity ^0.8.13;

contract Fallback {
    event Log(string func, uint gas);
    //log() function can be used within the function to print specific output
    // depending on the context of the smart contract.

    //fallback function must be declarede as external
    fallback() external payable {
        //send / transfer (forwards 2300 gas to this fallback function)
        //call (forwards all of the gas)
        emit Log("fallback",gasleft());
        // An event is emitted, 
        //it stores the arguments passed in transaction logs. 
    }

    //receive is a varinat of fallback that is triggered when msg.data is empty
    receive() external payable {
        emit Log("receive", gasleft());
    }

    //helper function to check the balance of this content
    function getBalance() public view returns (uint) {
        return address(this).balance;
    } 
}

contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to)public payable {
        (bool sent,) = _to.call{value:msg.value}("");
        require(sent, "failed to send ether");
    }
}