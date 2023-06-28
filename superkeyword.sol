// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

//super keyword allow you to inherit the pattern contract 

/*   Inheritance tree
      A
     / \
     B  C
     \  /
       D

*/

contract A{
    //this is called an event .you an emit events from your function
    //and they are logged into the transaction log
    //in our case , this will be usefull for tracing funtion callls.
    event Log(string message);

    function foo() public virtual {
        emit Log("A .foo called");
    }

    function bar() public virtual {
        emit Log("A .bar called");
    }
}

contract B is A{
    function foo() public  virtual  override {
        emit Log("b.foo Called");
        A.foo();
    }

    function bar() public  virtual  override {
        emit Log("b.bar Called");
        super.bar();
    }
 }

 contract C is A{
    function foo() public  virtual  override {
        emit Log("C.foo Called");
        A.foo();
    }

    function bar() public  virtual  override {
        emit Log("C.bar Called");
        super.bar();
    }
 }

contract D is B,C{
    //try:
    //call D.foo and check the transaction Logs
    //Although D inherits A,B and c ,it only called C and then A.
    //call D.bar and check the transcation Logs
    //D called C, then B , and fially A.
    //ALthough super was called twice (by B and C) it only called A once.

    function foo() public override (B,C) {
        super.foo();
    }

    function bar() public override (B,C) {
        super.bar();
    }
}