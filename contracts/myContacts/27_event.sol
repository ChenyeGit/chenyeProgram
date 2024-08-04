// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Event{
    event Log(address indexed sender,string messge);

    event AnotherLog();

    function test() public{
        emit Log(messge.sender,"hello world");
        emit Log(msg.sender,"Hello Evm");
        emit AnotherLog();
    }
}