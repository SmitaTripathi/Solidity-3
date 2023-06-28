// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

//allow to inherit the state variables unlike the function the redeclaration do not take place

contract A {
    string public name ="Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}


//earlier version
//shadowing is diallowed in solidity 0.6
//this will not compile
//contract B in A {
 //   string public name = "Contract B";
 //  }

 contract C is A{
     //this is the correct way yo overrride inherited state variables
     constructor() {
         //through the constructor we get the  A contract as well 
         name= "Contract C";
     }

     //C.getNmae returns "Contract C"
 }

 //To override the property of state varibale in a parent contract and 
// use a different property in a child contract 
//by this we can change the state variable
