// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

//we use events as state variable because they cost low in comparsion to state varaible

contract Event {
    //event declaration 
    //up to 3 parameters can be indexed
    //indexed parameters helps you filter the logs by the indexed parameter

    event Log(address indexed sender, string message);
    event AnotherLog();
    function test() public {
        emit Log(msg.sender,"Hello World!");
        emit Log(msg.sender,"Hello EVM");
        emit AnotherLog();
    }
}

//instead of usuage of storage dat events can take place