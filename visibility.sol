// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

//functions and state variables have to declare whether they are accesssible by other contracts

//functions can be declared as:
//** public:  any contract and account can call
//** private : only inside the contract that defines the function 
//** internal: only inside contract that inherits an internal function 
//** external : only other contract and accounts can call


contract Base {
    //private function can only be called
    //inside this contract
    //contracts that inherit this contract cannot call this function

    function privateFunc()  private pure returns (string memory) {
        return privateFunc();
    }

    //internal function can be called 
    //inside this contract 
    //inside contracts that inherit this contract
    function internalFunc() internal pure returns (string memory) {
        return "internal funtion called"; 
    }

    function testInternalFunc() public pure virtual returns(string memory) {
        return internalFunc();
    }
    //public functions can be called 
    //--inside this contract 
    //-inside ontracts that inherit this contract
    //--by other contracts and accounts
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    //external functions can only be called
    //--by other contracts and accounts
    function externalFuc() external pure returns (string memory) {
        return "external function called";
    }

    //this functon will not compile since we're trying to call
    //an external function here.
    //function testExternalFunc() public pure returns (string memory) {
        // return externalFunc();
    // }

    //state variables
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar= "my public variable";
    //state vriables cannot be external so this code wont compile
    //string extenal variables externalVar ="my externl variable" ;

}  

contract Child is Base{
     //inherited contracts do not have access to private functions 
     //and state variables
     //function testPrivateFunc() public pure returns (string memory) {
         //return privateFunc();
         // }

         //internal function call be called inside the child contracts
         function testInternalFunc() public  pure  override  returns (string memory) {
             return internalFunc();
         }
}

//cant access state variables
