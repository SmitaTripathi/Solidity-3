// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

//by payable keyword you will be able to get the ether in the contracts 

contract Payable {
    //payable address can receive Ether
    address payable public owner;

  // payable contructor can receive Ether'
  constructor() payable {
      owner = payable(msg.sender);
  }
  

  //function to deposit ether into this contract
  //call this function along with some ether
  //this balance of this contract will be automatically updated
  function deposit() public payable{}

  //call this function along with some ether 
  //this function will throw an error since this function is not payable
  function notpayable() public {}

  //function to withdraw all ether from this contract
  function withdraw() public {
      //get amount of ether stored in this contract 
      uint amount = address(this).balance;

      //send all ether to the owner
      //owner can receive ether since the address of owner is payable
      (bool success,) = owner.call{value:amount}("");
      require(success, "Failed to send ether");
  }

  //function to transfer ether from this contract to address from input
  function transfer(address  payable _to, uint _amount) public {
      //note that "to" is decalrable as payable
      (bool success ,)= _to.call{value:_amount}("");
      require(success, "failed to send ether");
  }

}