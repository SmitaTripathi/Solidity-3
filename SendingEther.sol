// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

//in order to transfer ether in solidity we have various methods 
//they are generally three
//** transfer(2300 gas, throws error)
//** send(2300 gas, returns bool)
//** call(forward all gas or set gas, returns bool)

contract ReceiveEther {
    /*
    which function is called ,fallback() or receive () ?

                    send ether
                        |
                    msg.data is empty?
                    /    \
                    yes     no
                    /         \
            receive() exists?    fallback
    */

    //function to reive ether.msg.data must be empty
    // receive amount must be payable else will throw error
    receive() external payable {}

    //fallback function is clled when msg.data is not empty
    fallback() external payable{}

    function getBalance() public view returns (uint){
        return address(this).balance;
    }
}


//2nd method//
contract SendEther{
     function sendViatransfer(address payable _to ) public payable  {
         //this function is no longer recommedded for sending ether
         _to.transfer(msg.value);
     }

     function sendViaSend(address payable _to) public payable {
         //send returns a boolean value indicating success or failure
         //this function is mot recommended for sending ether
         bool sent = _to.send(msg.value);
         require(sent, "Failed to send ether");
     }

     //mostly recommeded ststem to send ether
     function sendVaiCall(address payable _to) public payable {
         //call returns a boolean value indicating success or failure
         (bool sent , bytes memory data) = _to.call{value:msg.value}("");
         require(sent , "failed to send ether");
     }
}